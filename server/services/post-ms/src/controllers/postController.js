const { Post, User } = require("@TolgaYld/core-buzzup");
const { DateTime } = require("luxon");


const findAll = async (req, res) => {
  const findAllPosts = await Post.find().exec();

  res.status(200).json({
    success: true,
    data: findAllPosts || [],
  });
};

const findOne = async (req, res) => {
  const { id } = req.params;

  if (id == null) {
    throw { statusCode: 400, message: "post-not-found" };
  }

  const findOnePost = await Post.findById(id).exec();

  if (findOnePost == null) {
    throw { statusCode: 404, message: "post-not-found" };
  }

  res.status(200).json({
    success: true,
    data: findOnePost,
  });
};


const findAllPostsFromUser = async (req, res) => {
  const { id } = req.params;

  if (id == null) {
    throw { statusCode: 400, message: "post-not-found" };
  }

  const posts = await Post.find({ user: id }).exec();

  res.status(200).json({
    success: true,
    data: posts || [],
  });
};


const createPost = async (req, res) => {
  const isPostAnonym = req.body.data.type === "ANONYMOUS";
  const endDate = isPostAnonym
    ? DateTime.now().plus({ hours: 12 }).toJSDate()
    : null;

  const createdPost = await Post.create({
    ...req.body.data,
    end_date: endDate,
    created_by: req.user,
  });

  if (createdPost == null) {
    throw { statusCode: 400, message: "post-not-created" };
  }

  res.status(201).json({
    success: true,
    data: createdPost,
  });
};


const updatePost = async (req, res) => {
  const { id } = req.params;
  const findPost = await Post.findById(id).exec();

  if (findPost == null) {
    throw { statusCode: 404, message: "post-not-found" };
  }
  const isPostAnonym = req.body.data.type === "ANONYMOUS";
  const endDate = isPostAnonym
    ? req.body.data.end_date == null ? DateTime.now().plus({ hours: 12 }).toJSDate() : req.body.data.end_date
    : null;

  const updatedPost = await Post.findByIdAndUpdate(
    findPost._id,
    {
      ...req.body.data,
      end_date: endDate,
      last_update_from_user: req.user,
    },
    { new: true }
  ).exec();

  if (updatedPost == null) {
    throw { statusCode: 400, message: "update-failed" };
  }

  res.status(200).json({
    success: true,
    data: updatedPost,
  });
};


const likeOrDislikePost = async (req, res) => {
  const { id } = req.params;
  const user = req.user;

  const findPost = await Post.findById(id).exec();
  if (findPost == null) {
    throw { statusCode: 404, message: "post-not-found" };
  }

  const hasAlreadyLiked = findPost.likes.includes(user);
  const hasAlreadyDisliked = findPost.dislikes.includes(user);

  let updateQuery = {};

  if (req.body.like) {
    if (hasAlreadyLiked) {
      updateQuery.$pull = { likes: user };
    } else {
      updateQuery.$push = { likes: user };
      if (hasAlreadyDisliked) {
        updateQuery.$pull = { ...updateQuery.$pull, dislikes: user };
      }
    }
  } else {
    if (hasAlreadyDisliked) {
      updateQuery.$pull = { dislikes: user };
    } else {
      updateQuery.$push = { dislikes: user };
      if (hasAlreadyLiked) {
        updateQuery.$pull = { ...updateQuery.$pull, likes: user };
      }
    }
  }

  const updatedPost = await Post.findByIdAndUpdate(findPost._id, updateQuery, { new: true }).exec();
  if (updatedPost == null) {
    throw { statusCode: 400, message: "update-failed" };
  }

  res.status(200).json({
    success: true,
    data: updatedPost,
  });
};

const togglePublicVote = async (req, res) => {
  const { id } = req.params;
  const user = req.user;
  const { vote } = req.body;


  const findPost = await Post.findById(id).exec();
  if (findPost == null) {
    throw { statusCode: 404, message: "post-not-found" };
  }
  const hasVoted = findPost.public_votes.includes(user);

  let updateQuery = {};

  if (vote) {
    if (hasVoted == false) {
      updateQuery.$push = { publicVotes: user };
    }
  } else {
    if (hasVoted) {
      updateQuery.$pull = { publicVotes: user };
    }
  }

  const updatedPost = await Post.findByIdAndUpdate(
    findPost._id,
    updateQuery,
    { new: true }
  ).exec();

  if (updatedPost == null) {
    throw { statusCode: 400, message: "update-failed" };
  }

  res.status(200).json({
    success: true,
    data: updatedPost,
  });
};

const findInRadius = async (req, res) => {
  const userId = req.user._id;

  // Update longitude & latitude of user
  const updatedUser = await User.findByIdAndUpdate(
    userId,
    {
      location: {
        coordinates: req.body.data.coordinates,
      },
    },
    { new: true }
  ).exec();

  if (!updatedUser) {
    throw { statusCode: 400, message: "update-failed" };
  }

  const posts = await Post.find({
    location: {
      $near: {
        $geometry: {
          type: "Point",
          coordinates: updatedUser.location.coordinates,
        },
        $maxDistance: updatedUser.distance,
      },
    },
  }).exec();

  res.status(200).json({
    success: true,
    data: posts || [],
  });
};

const deletePost = async (req, res) => {
  const { id } = req.params;

  const post = await Post.findById(id).exec();
  if (post == null) {
    throw { statusCode: 404, message: "post-not-found" };
  }

  const deletedPost = await Post.findByIdAndDelete(id).exec();
  if (deletedPost == null) {
    throw { statusCode: 400, message: "post-delete-failed" };
  }
  res.status(200).json({
    success: true,
    data: post,
  });
};


module.exports = {
  findAll,
  findOne,
  findAllPostsFromUser,
  createPost,
  updatePost,
  likeOrDislikePost,
  togglePublicVote,
  findInRadius,
  deletePost,
};

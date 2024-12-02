const { Story, User } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");

const findAll = async (req, res) => {
  const findAllStorys = await Story.find().exec();

  return res.status(200).json({
    success: true,
    data: findAllStorys || [],
  });
};

const findOne = async (req, res) => {
  const { id } = req.params;

  const findOneStory = await Story.findById(id).exec();

  if (findOneStory == null) {
    throw { statusCode: 404, message: "story-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findOneStory,
  });
};

const findAllStorysFromUser = async (req, res) => {
  const { id } = req.params;

  const findAllStorys = await Story.find({ user: id }).exec();

  return res.status(200).json({
    success: true,
    data: findAllStorys || [],
  });
};

const createStory = async (req, res) => {
  const createdStory = await Story.create({
    ...req.body.data,
    user: req.user,
  });

  if (createdStory == null) {
    throw { statusCode: 400, message: "story-not-created" };
  }

  return res.status(201).json({
    success: true,
    data: createdStory,
  });
};


const updateStory = async (req, res) => {
  const { id } = req.params;

  const findStory = await Story.findById(id).exec();
  if (findStory == null) {
    throw { statusCode: 404, message: "story-not-found" };
  }

  const updatedStory = await Story.findByIdAndUpdate(
    id,
    { ...req.body },
    { new: true }
  ).exec();

  if (updatedStory == null) {
    throw { statusCode: 400, message: "update-failed" };
  }

  return res.status(200).json({
    success: true,
    data: updatedStory,
  });
};


const likeOrDislikeStory = async (req, res) => {
  const { id } = req.params;
  const user = req.user;


  const findStory = await Story.findById(id).exec();
  if (findStory == null) {
    return res.status(404).json({
      success: false,
      message: "story-not-found",
    });
  }

  const hasAlreadyLiked = findStory.likes.includes(user);
  const hasAlreadyDisliked = findStory.dislikes.includes(user);

  let updateQuery;

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

  const updatedStory = await Story.findByIdAndUpdate(id, updateQuery, { new: true }).exec();

  if (updatedStory == null) {
    throw { statusCode: 400, message: "update-failed" };
  }

  return res.status(200).json({
    success: true,
    data: updatedStory,
  });
};


const findInRadius = async (req, res) => {
  const { coordinates } = req.body;

  if (coordinates == null) {
    throw {
      statusCode: 400,
      message: "coordinates-missing",
    };
  }

  const updatedUser = await User.findByIdAndUpdate(
    req.headers.authorization,
    {
      location: { coordinates },
    },
    { new: true }
  ).exec();

  if (updatedUser == null) {
    throw {
      statusCode: 400,
      message: "user-update-failed",
    };
  }

  const stories = await Story.find({
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

  if (stories == null) {
    throw {
      statusCode: 404,
      message: "stories-not-found",
    };
  }

  res.status(200).json({
    success: true,
    data: stories || [],
  });
};

const deleteStory = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();

      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const { id } = req.params;
        const findStory = await Story.findById(id).exec();

        if (!findStory) {
          return await errorHandler(404, "story-not-found", true, req, res);
        } else {
          const deletedStory = await Story.findByIdAndDelete(id).exec();

          if (!deletedStory) {
            return await errorHandler(
              400,
              "story-delete-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: findStory,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

module.exports = {
  findAll,
  findOne,
  findAllStorysFromUser,
  createStory,
  updateStory,
  likeOrDislikeStory,
  findInRadius,
  deleteStory,
};

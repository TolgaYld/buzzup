const { User, Post, Comment } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");
const mongoose = require("mongoose");

const findAll = async (req, res) => {
  const findAllComments = await Comment.find().exec();
  if (findAllComments == null) {
    throw { statusCode: 404, message: "comments-not-found" };
  }
  return res.status(200).json({
    success: true,
    data: findAllComments,
  });
};

const findOne = async (req, res) => {
  const { id } = req.params;

  const findOneComment = await Comment.findById(id).exec();

  if (findOneComment == null) {
    throw { statusCode: 404, message: "comment-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findOneComment,
  });
};

const findAllCommentsFromUser = async (req, res) => {
  const { id } = req.params;

  const findAllComments = await Comment.find({ user: id }).exec();

  if (findAllComments == null) {
    throw { statusCode: 404, message: "comments-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findAllComments,
  });
};

const createComment = async (req, res) => {
  const session = await mongoose.startSession();
  session.startTransaction();
  const { post, ...commentData } = req.body.data;

  const findPost = await Post.findById(post).session(session).exec();

  if (findPost == null) {
    await session.abortTransaction();
    session.endSession();
    throw { statusCode: 404, message: "post-not-found" };
  }
  const createdComment = await Comment.create(
    [
      {
        ...req.body.data,
        created_by: req.user._id,
      },
    ],
    { session }
  );

  if (createdComment == null) {
    await session.abortTransaction();
    session.endSession();
    throw { statusCode: 400, message: "comment-not-created" };
  }
  try {
    findPost.comments.push(createdComment)
    await findPost.save({ session });
  } catch (error) {
    await session.abortTransaction();
    await session.endSession();
    throw { statusCode: 400, message: "comment-not-created" };
  }

  await session.commitTransaction();
  await session.endSession();

  await res.status(201).json({
    success: true,
    data: createdComment,
  });
};

const updateComment = async (req, res) => {
  const session = await mongoose.startSession();
  session.startTransaction();
  try {
    const { id } = req.params;
    const { post } = req.body.data;


    const findPost = await Post.findById(post).session(session).exec();

    if (findPost == null) {
      throw { statusCode: 404, message: "post-not-found" };
    }

    const findComment = await Comment.findById(id).session(session).exec();

    if (findComment == null) {
      throw { statusCode: 404, message: "comment-not-found" };
    }

    const updatedComment = await Comment.findByIdAndUpdate(
      id,
      {
        ...req.body.data,
      },
      { new: true, session },
    ).exec();

    if (updatedComment == null) {
      throw { statusCode: 400, message: "comment-update-failed" };
    }

    await session.commitTransaction();
    await session.endSession();

    await res.status(200).json({
      success: true,
      data: updatedComment,
    });


  } catch (error) {
    await session.abortTransaction();
    await session.endSession();
    throw error;
  }
};

const likeOrDislikeComment = async (req, res) => {
  const { id } = req.params;
  const { like } = req.body;

  const user = req.user;

  const findComment = await Comment.findById(id).exec();

  if (findComment == null) {
    throw { statusCode: 404, message: "comment-not-found" };
  }

  const hasLiked = findComment.likes.includes(user);
  const hasDisliked = findComment.dislikes.includes(user);

  let updateQuery = {};

  if (like) {
    // if client liked
    if (hasLiked) {
      // remove like
      updateQuery.$pull = { likes: user };
    } else {
      // add like and remove dislike if exists
      updateQuery.$push = { likes: user };
      if (hasDisliked) {
        updateQuery.$pull = { ...updateQuery.$pull, dislikes: user };
      }
    }
  } else {
    // if client disliked
    if (hasDisliked) {
      // Dislike entfernen
      updateQuery.$pull = { dislikes: user };
    } else {
      // add dislike and remove like if exists
      updateQuery.$push = { dislikes: user };
      if (hasLiked) {
        updateQuery.$pull = { ...updateQuery.$pull, likes: user };
      }
    }
  }

  const updatedComment = await Comment.findByIdAndUpdate(
    id,
    updateQuery,
    { new: true }
  ).exec();

  if (updatedComment == null) {
    throw { statusCode: 400, message: "update-failed" };
  }

  return res.status(200).json({
    success: true,
    data: updatedComment,
  });
};

const deleteComment = async (req, res) => {
  const { id } = req.params;

  const findComment = await Comment.findById(id).exec();
  if (findComment == null) {
    throw { statusCode: 404, message: "comment-not-found" };
  }
  const deletedComment = await Comment.findByIdAndDelete(id).exec();
  if (deletedComment == null) {
    throw { statusCode: 400, message: "comment-delete-failed" };
  }
  return res.status(200).json({
    success: true,
    data: findComment,
  });
};

module.exports = {
  findAll,
  findOne,
  findAllCommentsFromUser,
  createComment,
  updateComment,
  likeOrDislikeComment,
  deleteComment,
};

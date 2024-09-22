const { User, Post, Comment } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");

const findAll = async (req, res) => {
  try {
    const id = req.headers.authorization;
    if (id == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(id).exec();

      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const findAllComments = await Comment.find().exec();
        if (!findAllComments) {
          return await errorHandler(404, "comments-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllComments,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findOne = async (req, res) => {
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
        const findOneComment = await Comment.findById(id).exec();

        if (!findOneComment) {
          return await errorHandler(404, "comment-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findOneComment,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findAllCommentsFromUser = async (req, res) => {
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
        const findAllComments = await Comment.find({ user: id }).exec();

        if (!findAllComments) {
          return await errorHandler(404, "comments-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllComments,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const createComment = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const findPost = await Post.findById(req.body.data.post);

        if (!findPost) {
          return await errorHandler(404, "post-not-found", true, req, res);
        } else {
          const createdComment = await Comment.create({
            ...req.body.data,
            created_by: findUser,
          });

          if (!createdComment) {
            return await errorHandler(
              400,
              "comment-not-created",
              true,
              req,
              res,
            );
          } else {
            const addCommentToPost = await Post.findByIdAndUpdate(
              findPost._id,
              { $push: { comments: createdComment } },
            ).exec();
            if (!addCommentToPost) {
              return await errorHandler(
                400,
                "comment-not-created",
                true,
                req,
                res,
              );
            } else {
              await res.status(201).json({
                success: true,
                data: createdComment,
              });
            }
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const updateComment = async (req, res) => {
  try {
    const userId = req.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const findPost = await Post.findById(req.body.data.post).exec();

        if (!findPost) {
          return await errorHandler(404, "post-not-found", true, req, res);
        } else {
          const { id } = req.params;
          const findComment = await Comment.findById(id).exec();

          if (!findComment) {
            return await errorHandler(404, "comment-not-found", true, req, res);
          } else {
            const updatedComment = await Comment.findByIdAndUpdate(
              id,
              {
                ...req.body.data,
              },
              { new: true },
            ).exec();

            if (!updatedComment) {
              return await errorHandler(
                400,
                "comment-update-failed",
                true,
                req,
                res,
              );
            } else {
              await res.status(200).json({
                success: true,
                data: updatedComment,
              });
            }
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const likeOrDislikeComment = async (req, res) => {
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
        const findComment = await Comment.findById(id).exec();

        if (!findComment) {
          return await errorHandler(404, "comment-not-found", true, req, res);
        } else {
          let updatedComment;
          let hasAlreadyLiked = false;
          let hasAlreadyDisliked = false;

          findComment.likes.forEach((user) => {
            if (user._id === userId) {
              hasAlreadyLiked = true;
            }
          });
          findComment.dislikes.forEach((user) => {
            if (user._id === userId) {
              hasAlreadyDisliked = true;
            }
          });
          if (req.body.like) {
            if (hasAlreadyLiked) {
              updatedComment = await Comment.findByIdAndUpdate(
                findComment._id,
                {
                  $pull: { likes: findUser },
                },
                { new: true },
              ).exec();
            } else {
              if (hasAlreadyDisliked) {
                updatedComment = await Comment.findByIdAndUpdate(
                  findComment._id,
                  {
                    $push: { likes: findUser },
                    $pull: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              } else {
                updatedComment = await Comment.findByIdAndUpdate(
                  findComment._id,
                  {
                    $push: { likes: findUser },
                  },
                  { new: true },
                ).exec();
              }
            }
          } else {
            if (hasAlreadyLiked) {
              updatedComment = await Comment.findByIdAndUpdate(
                findComment._id,
                {
                  $pull: { likes: findUser },
                  $push: { dislikes: findUser },
                },
                { new: true },
              ).exec();
            } else {
              if (hasAlreadyDisliked) {
                updatedComment = await Comment.findByIdAndUpdate(
                  findComment._id,
                  {
                    $pull: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              } else {
                updatedComment = await Comment.findByIdAndUpdate(
                  findComment._id,
                  {
                    $push: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              }
            }
          }

          if (!updatedComment) {
            return await errorHandler(400, "update-failed", true, req, res);
          } else {
            await res.status(200).json({
              success: true,
              data: updatedComment,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const deleteComment = async (req, res) => {
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
        const findComment = await Comment.findById(id).exec();
        if (!findComment) {
          return await errorHandler(404, "comment-not-found", true, req, res);
        } else {
          const deletedComment = await Comment.findByIdAndDelete(id).exec();

          if (!deletedComment) {
            return await errorHandler(
              400,
              "comment-delete-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: findComment,
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
  findAllCommentsFromUser,
  createComment,
  updateComment,
  likeOrDislikeComment,
  deleteComment,
};

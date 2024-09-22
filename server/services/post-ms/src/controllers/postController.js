const { Post, User } = require("@TolgaYld/core-buzzup");
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
        const findAllPosts = await Post.find().exec();
        if (!findAllPosts) {
          return await errorHandler(404, "posts-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllPosts,
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
        const findOnePost = await Post.findById(id).exec();

        if (!findOnePost) {
          return await errorHandler(404, "post-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findOnePost,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findAllPostsFromUser = async (req, res) => {
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
        const findAllPosts = await Post.find({ user: id }).exec();

        if (!findAllPosts) {
          return await errorHandler(404, "post-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllPosts,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const createPost = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const createdPost = await Post.create({
          ...req.body.data,
          created_by: findUser,
        });

        if (!createdPost) {
          return await errorHandler(400, "post-not-created", true, req, res);
        } else {
          await res.status(201).json({
            success: true,
            data: createdPost,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const updatePost = async (req, res) => {
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
        const findPost = await Post.findById(id).exec();

        if (!findPost) {
          return await errorHandler(404, "post-not-found", true, req, res);
        } else {
          const updatedPost = await Post.findByIdAndUpdate(
            findPost._id,
            {
              ...req.body,
            },
            { new: true },
          ).exec();

          if (!updatedPost) {
            return await errorHandler(400, "update-failed", true, req, res);
          } else {
            await res.status(200).json({
              success: true,
              data: updatedPost,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const likeOrDislikePost = async (req, res) => {
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
        const findPost = await Post.findById(id).exec();

        if (!findPost) {
          return await errorHandler(404, "post-not-found", true, req, res);
        } else {
          let updatedPost;
          let hasAlreadyLiked = false;
          let hasAlreadyDisliked = false;

          findPost.likes.forEach((user) => {
            if (user._id === userId) {
              hasAlreadyLiked = true;
            }
          });
          findPost.dislikes.forEach((user) => {
            if (user._id === userId) {
              hasAlreadyDisliked = true;
            }
          });
          if (req.body.like) {
            if (hasAlreadyLiked) {
              updatedPost = await Post.findByIdAndUpdate(
                findPost._id,
                {
                  $pull: { likes: findUser },
                },
                { new: true },
              ).exec();
            } else {
              if (hasAlreadyDisliked) {
                updatedPost = await Post.findByIdAndUpdate(
                  findPost._id,
                  {
                    $push: { likes: findUser },
                    $pull: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              } else {
                updatedPost = await Post.findByIdAndUpdate(
                  findPost._id,
                  {
                    $push: { likes: findUser },
                  },
                  { new: true },
                ).exec();
              }
            }
          } else {
            if (hasAlreadyLiked) {
              updatedPost = await Post.findByIdAndUpdate(
                findPost._id,
                {
                  $pull: { likes: findUser },
                  $push: { dislikes: findUser },
                },
                { new: true },
              ).exec();
            } else {
              if (hasAlreadyDisliked) {
                updatedPost = await Post.findByIdAndUpdate(
                  findPost._id,
                  {
                    $pull: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              } else {
                updatedPost = await Post.findByIdAndUpdate(
                  findPost._id,
                  {
                    $push: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              }
            }
          }

          if (!updatedPost) {
            return await errorHandler(400, "update-failed", true, req, res);
          } else {
            await res.status(200).json({
              success: true,
              data: updatedPost,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findInRadius = async (req, res) => {
  try {
    const id = req.headers.authorization;
    if (id == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(id).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        //Update longitude & latitude
        const updatedUser = await User.findByIdAndUpdate(
          id,
          {
            location: {
              coordinates: req.body.data.coordinates,
            },
          },
          { new: true },
        ).exec();
        if (!updatedUser) {
          return await errorHandler(400, "update-failed", true, req, res);
        } else {
          const findAllPosts = await Post.find({
            location: {
              $near: {
                $geometry: {
                  type: "Point",
                  coordinates: [
                    updatedUser.location.coordinates[0],
                    updatedUser.location.coordinates[1],
                  ],
                },
                $maxDistance: findUser.distance,
              },
            },
          }).exec();
          if (!findAllPosts) {
            return await errorHandler(404, "posts-not-found", true, req, res);
          } else {
            await res.status(200).json({
              success: true,
              data: findAllPosts,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const deletePost = async (req, res) => {
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
        const findPost = await Post.findById(id).exec();

        if (!findPost) {
          return await errorHandler(404, "post-not-found", true, req, res);
        } else {
          const deletedPost = await Post.findByIdAndDelete(id).exec();

          if (!deletedPost) {
            return await errorHandler(
              400,
              "post-delete-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: findPost,
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
  findAllPostsFromUser,
  createPost,
  updatePost,
  likeOrDislikePost,
  findInRadius,
  deletePost,
};

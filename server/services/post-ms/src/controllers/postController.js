const { Post, User } = require("@TolgaYld/core-buzzup");
const errorHandler = require("../errors/errorHandler");

const findAll = async (request, reply) => {
  try {
    const id = request.headers.authorization;
    if (id == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(id).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const findAllPosts = await Post.find().exec();
        if (!findAllPosts) {
          return await errorHandler(
            404,
            "posts-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findAllPosts,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const findOne = async (request, reply) => {
  try {
    const userId = request.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const { id } = request.params;
        const findOnePost = await Post.findById(id).exec();

        if (!findOnePost) {
          return await errorHandler(
            404,
            "post-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findOnePost,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const findAllPostsFromUser = async (request, reply) => {
  try {
    const userId = request.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const { id } = request.params;
        const findAllPosts = await Post.find({ user: id }).exec();

        if (!findAllPosts) {
          return await errorHandler(
            404,
            "post-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findAllPosts,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const createPost = async (request, reply) => {
  try {
    const userId = request.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const createdPost = await Post.create({
          ...request.body.data,
          user: findUser,
        });

        if (!createdPost) {
          return await errorHandler(
            400,
            "post-not-created",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(201).send({
            success: true,
            data: createdPost,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, request, reply);
  }
};

const updatePost = async (request, reply) => {
  try {
    const userId = request.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const { id } = request.params;
        const findPost = await Post.findById(id).exec();

        if (!findPost) {
          return await errorHandler(
            404,
            "post-not-found",
            true,
            request,
            reply,
          );
        } else {
          const updatedPost = await Post.findByIdAndUpdate(
            findPost._id,
            {
              ...request.body,
            },
            { new: true },
          ).exec();

          if (!updatedPost) {
            return await errorHandler(
              400,
              "update-failed",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: updatedPost,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const likeOrDislikePost = async (request, reply) => {
  try {
    const userId = request.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const { id } = request.params;
        const findPost = await Post.findById(id).exec();

        if (!findPost) {
          return await errorHandler(
            404,
            "post-not-found",
            true,
            request,
            reply,
          );
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
          if (request.body.like) {
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
            return await errorHandler(
              400,
              "update-failed",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: updatedPost,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const findInRadius = async (request, reply) => {
  try {
    const id = request.headers.authorization;
    if (id == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(id).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        //Update longitude & latitude
        const updatedUser = await User.findByIdAndUpdate(
          id,
          {
            location: {
              coordinates: request.body.coordinates,
            },
          },
          { new: true },
        ).exec();
        if (!updatedUser) {
          return await errorHandler(400, "update-failed", true, request, reply);
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
            return await errorHandler(
              404,
              "posts-not-found",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: findAllPosts,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const deletePost = async (request, reply) => {
  try {
    const userId = request.headers.authorization;
    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();

      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const { id } = request.params;
        const findPost = await Post.findById(id).exec();

        if (!findPost) {
          return await errorHandler(
            404,
            "post-not-found",
            true,
            request,
            reply,
          );
        } else {
          const deletedPost = await Post.findByIdAndDelete(id).exec();

          if (!deletedPost) {
            return await errorHandler(
              400,
              "post-delete-failed",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: findPost,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
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

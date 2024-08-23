const { Story, User } = require("@TolgaYld/core-buzzup");
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
        const findAllStorys = await Story.find().exec();
        if (!findAllStorys) {
          return await errorHandler(
            404,
            "storys-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findAllStorys,
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
        const findOneStory = await Story.findById(id).exec();

        if (!findOneStory) {
          return await errorHandler(
            404,
            "story-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findOneStory,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const findAllStorysFromUser = async (request, reply) => {
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
        const findAllStorys = await Story.find({ user: id }).exec();

        if (!findAllStorys) {
          return await errorHandler(
            404,
            "story-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findAllStorys,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const createStory = async (request, reply) => {
  try {
    const userId = request.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const createdStory = await Story.create({
          ...request.body.data,
          user: findUser,
        });

        if (!createdStory) {
          return await errorHandler(
            400,
            "story-not-created",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(201).send({
            success: true,
            data: createdStory,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, request, reply);
  }
};

const updateStory = async (request, reply) => {
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
        const findStory = await Story.findById(id).exec();

        if (!findStory) {
          return await errorHandler(
            404,
            "story-not-found",
            true,
            request,
            reply,
          );
        } else {
          const updatedStory = await Story.findByIdAndUpdate(
            findStory._id,
            {
              ...request.body,
            },
            { new: true },
          ).exec();

          if (!updatedStory) {
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
              data: updatedStory,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const likeOrDislikeStory = async (request, reply) => {
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
        const findStory = await Story.findById(id).exec();

        if (!findStory) {
          return await errorHandler(
            404,
            "story-not-found",
            true,
            request,
            reply,
          );
        } else {
          let updatedStory;
          let hasAlreadyLiked = false;
          let hasAlreadyDisliked = false;

          findStory.likes.forEach((user) => {
            if (user._id === userId) {
              hasAlreadyLiked = true;
            }
          });
          findStory.dislikes.forEach((user) => {
            if (user._id === userId) {
              hasAlreadyDisliked = true;
            }
          });
          if (request.body.like) {
            if (hasAlreadyLiked) {
              updatedStory = await Story.findByIdAndUpdate(
                findStory._id,
                {
                  $pull: { likes: findUser },
                },
                { new: true },
              ).exec();
            } else {
              if (hasAlreadyDisliked) {
                updatedStory = await Story.findByIdAndUpdate(
                  findStory._id,
                  {
                    $push: { likes: findUser },
                    $pull: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              } else {
                updatedStory = await Story.findByIdAndUpdate(
                  findStory._id,
                  {
                    $push: { likes: findUser },
                  },
                  { new: true },
                ).exec();
              }
            }
          } else {
            if (hasAlreadyLiked) {
              updatedStory = await Story.findByIdAndUpdate(
                findStory._id,
                {
                  $pull: { likes: findUser },
                  $push: { dislikes: findUser },
                },
                { new: true },
              ).exec();
            } else {
              if (hasAlreadyDisliked) {
                updatedStory = await Story.findByIdAndUpdate(
                  findStory._id,
                  {
                    $pull: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              } else {
                updatedStory = await Story.findByIdAndUpdate(
                  findStory._id,
                  {
                    $push: { dislikes: findUser },
                  },
                  { new: true },
                ).exec();
              }
            }
          }

          if (!updatedStory) {
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
              data: updatedStory,
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
          const findAllStorys = await Story.find({
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
          if (!findAllStorys) {
            return await errorHandler(
              404,
              "storys-not-found",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: findAllStorys,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const deleteStory = async (request, reply) => {
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
        const findStory = await Story.findById(id).exec();

        if (!findStory) {
          return await errorHandler(
            404,
            "story-not-found",
            true,
            request,
            reply,
          );
        } else {
          const deletedStory = await Story.findByIdAndDelete(id).exec();

          if (!deletedStory) {
            return await errorHandler(
              400,
              "story-delete-failed",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: findStory,
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
  findAllStorysFromUser,
  createStory,
  updateStory,
  likeOrDislikeStory,
  findInRadius,
  deleteStory,
};

const { Story, User } = require("@TolgaYld/core-buzzup");
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
        const findAllStorys = await Story.find().exec();
        if (!findAllStorys) {
          return await errorHandler(404, "storys-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllStorys,
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
        const findOneStory = await Story.findById(id).exec();

        if (!findOneStory) {
          return await errorHandler(404, "story-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findOneStory,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findAllStorysFromUser = async (req, res) => {
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
        const findAllStorys = await Story.find({ user: id }).exec();

        if (!findAllStorys) {
          return await errorHandler(404, "story-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllStorys,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const createStory = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const createdStory = await Story.create({
          ...req.body.data,
          user: findUser,
        });

        if (!createdStory) {
          return await errorHandler(400, "story-not-created", true, req, res);
        } else {
          await res.status(201).json({
            success: true,
            data: createdStory,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const updateStory = async (req, res) => {
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
          const updatedStory = await Story.findByIdAndUpdate(
            findStory._id,
            {
              ...req.body,
            },
            { new: true },
          ).exec();

          if (!updatedStory) {
            return await errorHandler(400, "update-failed", true, req, res);
          } else {
            await res.status(200).json({
              success: true,
              data: updatedStory,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const likeOrDislikeStory = async (req, res) => {
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
          if (req.body.like) {
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
            return await errorHandler(400, "update-failed", true, req, res);
          } else {
            await res.status(200).json({
              success: true,
              data: updatedStory,
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
              coordinates: req.body.coordinates,
            },
          },
          { new: true },
        ).exec();
        if (!updatedUser) {
          return await errorHandler(400, "update-failed", true, req, res);
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
            return await errorHandler(404, "storys-not-found", true, req, res);
          } else {
            await res.status(200).json({
              success: true,
              data: findAllStorys,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
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

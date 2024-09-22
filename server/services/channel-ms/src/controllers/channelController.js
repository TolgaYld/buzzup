const { Channel, User } = require("@TolgaYld/core-buzzup")
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
        const findAllChannels = await Channel.find().exec();
        if (!findAllChannels) {
          return await errorHandler(404, "channels-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllChannels,
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
        const findOneChannel = await Channel.findById(id).exec();

        if (!findOneChannel) {
          return await errorHandler(404, "channel-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findOneChannel,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const findAllChannelsFromUser = async (req, res) => {
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
        const findAllChannels = await Channel.find({ users: id }).exec();

        if (!findAllChannels) {
          return await errorHandler(404, "channel-not-found", true, req, res);
        } else {
          await res.status(200).json({
            success: true,
            data: findAllChannels,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const createChannel = async (req, res) => {
  try {
    const userId = req.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, req, res);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, req, res);
      } else {
        const createdChannel = await Channel.create({
          ...req.body.data,
          users: [findUser],
          created_by: findUser,
        });

        if (!createdChannel) {
          return await errorHandler(400, "channel-not-created", true, req, res);
        } else {
          await res.status(201).json({
            success: true,
            data: createdChannel,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, req, res);
  }
};

const updateChannel = async (req, res) => {
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
        const findChannel = await Channel.findById(id).exec();

        if (!findChannel) {
          return await errorHandler(404, "channel-not-found", true, req, res);
        } else {
          const updatedChannel = await Channel.findByIdAndUpdate(
            findChannel._id,
            {
              ...req.body,
            },
            { new: true },
          ).exec();

          if (!updatedChannel) {
            return await errorHandler(
              400,
              "channel-update-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: updatedChannel,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const entryOrLeaveChannel = async (req, res) => {
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
        const findChannel = await Channel.findById(id).exec();

        if (!findChannel) {
          return await errorHandler(404, "channel-not-found", true, req, res);
        } else {
          let updatedChannel;
          let idExists = false;
          findChannel.users.forEach((user) => {
            if (user._id === userId) {
              idExists = true;
            }
          });
          if (!idExists) {
            updatedChannel = await Channel.findByIdAndUpdate(
              findChannel._id,
              {
                $push: { users: findUser },
              },
              { new: true },
            ).exec();
          } else {
            updatedChannel = await Channel.findByIdAndUpdate(
              findChannel._id,
              {
                $pull: { users: findUser },
              },
              { new: true },
            ).exec();
          }

          if (!updatedChannel) {
            return await errorHandler(
              400,
              "channel-update-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: updatedChannel,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, req, res);
  }
};

const deleteChannel = async (req, res) => {
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
        const findChannel = await Channel.findById(id).exec();

        if (!findChannel) {
          return await errorHandler(404, "channel-not-found", true, req, res);
        } else {
          const deletedChannel = await Channel.findByIdAndDelete(id).exec();

          if (!deletedChannel) {
            return await errorHandler(
              400,
              "channel-delete-failed",
              true,
              req,
              res,
            );
          } else {
            await res.status(200).json({
              success: true,
              data: findChannel,
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
  findAllChannelsFromUser,
  createChannel,
  updateChannel,
  entryOrLeaveChannel,
  deleteChannel,
};

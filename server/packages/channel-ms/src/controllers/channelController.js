const { Channel, User } = require("core-buzzup")
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
        const findAllChannels = await Channel.find().exec();
        if (!findAllChannels) {
          return await errorHandler(
            404,
            "channels-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findAllChannels,
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
        const findOneChannel = await Channel.findById(id).exec();

        if (!findOneChannel) {
          return await errorHandler(
            404,
            "channel-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findOneChannel,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const findAllChannelsFromUser = async (request, reply) => {
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
        const findAllChannels = await Channel.find({ users: id }).exec();

        if (!findAllChannels) {
          return await errorHandler(
            404,
            "channel-not-found",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(200).send({
            success: true,
            data: findAllChannels,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const createChannel = async (request, reply) => {
  try {
    const userId = request.headers.authorization;

    if (userId == null) {
      return await errorHandler(401, "unauthorized", true, request, reply);
    } else {
      const findUser = await User.findById(userId).exec();
      if (!findUser) {
        return await errorHandler(401, "unauthorized", true, request, reply);
      } else {
        const createdChannel = await Channel.create({
          ...request.body.data,
          users: [findUser],
          created_by: findUser,
        });

        if (!createdChannel) {
          return await errorHandler(
            400,
            "channel-not-created",
            true,
            request,
            reply,
          );
        } else {
          await reply.code(201).send({
            success: true,
            data: createdChannel,
          });
        }
      }
    }
  } catch (error) {
    return await errorHandler(400, error, false, request, reply);
  }
};

const updateChannel = async (request, reply) => {
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
        const findChannel = await Channel.findById(id).exec();

        if (!findChannel) {
          return await errorHandler(
            404,
            "channel-not-found",
            true,
            request,
            reply,
          );
        } else {
          const updatedChannel = await Channel.findByIdAndUpdate(
            findChannel._id,
            {
              ...request.body,
            },
            { new: true },
          ).exec();

          if (!updatedChannel) {
            return await errorHandler(
              400,
              "channel-update-failed",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: updatedChannel,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const entryOrLeaveChannel = async (request, reply) => {
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
        const findChannel = await Channel.findById(id).exec();

        if (!findChannel) {
          return await errorHandler(
            404,
            "channel-not-found",
            true,
            request,
            reply,
          );
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
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: updatedChannel,
            });
          }
        }
      }
    }
  } catch (error) {
    return await errorHandler(404, error, false, request, reply);
  }
};

const deleteChannel = async (request, reply) => {
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
        const findChannel = await Channel.findById(id).exec();

        if (!findChannel) {
          return await errorHandler(
            404,
            "channel-not-found",
            true,
            request,
            reply,
          );
        } else {
          const deletedChannel = await Channel.findByIdAndDelete(id).exec();

          if (!deletedChannel) {
            return await errorHandler(
              400,
              "channel-delete-failed",
              true,
              request,
              reply,
            );
          } else {
            await reply.code(200).send({
              success: true,
              data: findChannel,
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
  findAllChannelsFromUser,
  createChannel,
  updateChannel,
  entryOrLeaveChannel,
  deleteChannel,
};

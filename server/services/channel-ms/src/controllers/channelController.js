const { Channel, User } = require("@TolgaYld/core-buzzup")
const errorHandler = require("../errors/errorHandler");

const findAll = async (req, res) => {
  const findAllChannels = await Channel.find().exec();

  if (findAllChannels == null) {
    throw { statusCode: 404, message: "channels-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findAllChannels,
  });
};

const findOne = async (req, res) => {
  const { id } = req.params;
  const findOneChannel = await Channel.findById(id).exec();

  if (findOneChannel == null) {
    throw { statusCode: 404, message: "channel-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findOneChannel,
  });
};


const findAllChannelsFromUser = async (req, res) => {
  const { id } = req.params;
  const findAllChannels = await Channel.find({ users: id }).exec();

  if (findAllChannels == null) {
    throw { statusCode: 404, message: "channels-not-found" };
  }

  return res.status(200).json({
    success: true,
    data: findAllChannels,
  });
};

const createChannel = async (req, res) => {
  const user = req.user;
  const createdChannel = await Channel.create({
    ...req.body.data,
    users: [user],
    created_by: user,
  });
  if (createdChannel == null) {
    throw { statusCode: 400, message: "channel-not-created" };
  }
  return res.status(201).json({
    success: true,
    data: createdChannel,
  });
};

const updateChannel = async (req, res) => {
  const { id } = req.params;
  const findChannel = await Channel.findById(id).exec();

  if (findChannel == null) {
    throw { statusCode: 404, message: "channel-not-found" };
  }
  const updatedChannel = await Channel.findByIdAndUpdate(
    id,
    {
      ...req.body,
    },
    { new: true }
  ).exec();
  if (updatedChannel == null) {
    throw { statusCode: 400, message: "channel-update-failed" };
  }
  return res.status(200).json({
    success: true,
    data: updatedChannel,
  });
};

const entryOrLeaveChannel = async (req, res) => {
  const userId = req.user._id;
  const { id } = req.params;

  const findChannel = await Channel.findById(id).exec();

  if (findChannel == null) {
    throw { statusCode: 404, message: "channel-not-found" };
  }

  const isUserInChannel = findChannel.users.some((user) => user.equals(userId));

  const updateOperation = isUserInChannel
    ? { $pull: { users: userId } }
    : { $push: { users: userId } };

  const updatedChannel = await Channel.findByIdAndUpdate(
    id,
    updateOperation,
    { new: true }
  ).exec();

  if (updatedChannel == null) {
    throw { statusCode: 400, message: "channel-update-failed" };
  }

  return res.status(200).json({
    success: true,
    data: updatedChannel,
  });
};

const deleteChannel = async (req, res) => {
  const { id } = req.params;
  const findChannel = await Channel.findById(id).exec();
  if (findChannel == null) {
    throw { statusCode: 404, message: "channel-not-found" };
  }
  const deletedChannel = await Channel.findByIdAndDelete(id).exec();
  if (deletedChannel == null) {
    throw { statusCode: 400, message: "channel-delete-failed" };
  }

  return res.status(200).json({
    success: true,
    data: findChannel,
  });
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

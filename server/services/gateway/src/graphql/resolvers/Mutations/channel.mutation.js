const { getUserId } = require("@TolgaYld/core-buzzup");
const createError = require("http-errors");
const axios = require("axios");
const errorHandler = require("../../../errors/errorHandler");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

module.exports = {
  createChannel: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (!id) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.post(
      `${process.env.CHANNELSERVICE}/create`,
      {
        type: "CreateChannel",
        data: args.data,
      },
      { headers }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  updateChannel: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.patch(
      `${process.env.CHANNELSERVICE}/update/${args.id}`,
      {
        type: "UpdateChannel",
        data: {
          ...args.data,
          last_update_from_user: id,
        },
      },
      { headers }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  deleteChannelFromDb: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }

    const headers = { Authorization: id };
    const response = await axios.delete(
      process.env.CHANNELSERVICE + "/delete/" + args.id,
      {
        type: "DeletePostFromDb",
      },
      { headers },
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

  entryOrLeaveChannel: catchGraphQLResolverErrors(async (parent, args, { req }) => {
    const id = await getUserId(req);

    if (id == null) {
      throw { statusCode: 401, message: "Unauthorized" };
    }
    const headers = { Authorization: id };
    const response = await axios.patch(
      `${process.env.CHANNELSERVICE}/entryOrLeave/${args.id}`,
      {
        type: "EntryOrLeaveChannel",
      },
      { headers }
    );

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),

};

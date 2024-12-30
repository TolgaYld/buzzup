const { getUserId } = require("@TolgaYld/core-buzzup");
const axios = require("axios");
const errorHandler = require("../../../errors/errorHandler");
const { User, AUTHSERVICE } = require("@TolgaYld/core-buzzup");
const { catchGraphQLResolverErrors } = require("../../../core/utils/graphqlUtils");

module.exports = {
  signUpUser: catchGraphQLResolverErrors(async (parent, args, { pubsub }) => {
    const response = await axios.post(`${AUTHSERVICE}/signUp`, {
      type: "signUpUser",
      data: {
        ...args.data,
        email_confirmed: false,
        is_admin: false,
      },
    });

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  authUserWithProvider: catchGraphQLResolverErrors(async (parent, args, { pubsub }) => {
    const response = await axios.post(`${AUTHSERVICE}/authWithProvider`, {
      type: "authUserWithProvider",
      data: {
        ...args.data,
        email_confirmed: false,
        is_admin: false,
      },
    });

    if (response.data.success) {
      return response.data.data;
    }

    throw { statusCode: response.status, message: response.data.msg };
  }, errorHandler),


  signInUser: catchGraphQLResolverErrors(
    async (parent, { data: { emailOrUsername, password, coordinates } }, { req }) => {
      const response = await axios.post(`${AUTHSERVICE}/signIn`, {
        type: "signInUser",
        data: {
          emailOrUsername,
          password,
          coordinates,
        },
      });

      if (response.data.success) {
        return response.data.data;
      }

      throw { statusCode: response.status, message: response.data.msg };
    },
    errorHandler,
  ),

  deleteUser: catchGraphQLResolverErrors(
    async (parent, args, { req }) => {
      const id = await getUserId(req);
      if (id == null) {
        throw { statusCode: 401, message: "unauthorized" };
      }

      const headers = { Authorization: id };
      const response = await axios.patch(
        `${AUTHSERVICE}/update/${args.id}`,
        {
          type: "updateUser",
          data: {
            is_deleted: true,
            updated_by: id,
          },
        },
        { headers }
      );

      if (response.data.success) {
        return response.data.data;
      }

      throw { statusCode: response.status, message: response.data.msg };
    },
    errorHandler,
  ),


  deleteUserFromDb: catchGraphQLResolverErrors(
    async (parent, args, { req }) => {
      const id = await getUserId(req);
      if (id == null) {
        throw { statusCode: 401, message: "unauthorized" };
      }

      const headers = { Authorization: id };
      const response = await axios.delete(
        `${AUTHSERVICE}/delete/${args.id}`,
        {
          type: "DeleteUserFromDb",
          headers,
        }
      );

      if (response.data.success) {
        return `User: ${args.id} deleted`;
      }

      throw { statusCode: response.status, message: response.data.msg };
    },
    errorHandler
  ),


  updateUser: catchGraphQLResolverErrors(
    async (parent, args, { req }) => {
      const id = await getUserId(req);
      if (id == null) {
        throw { statusCode: 401, message: "unauthorized" };
      }

      const headers = { Authorization: id };
      const response = await axios.patch(
        `${AUTHSERVICE}/update/${id}`,
        {
          type: "updateUser",
          data: {
            ...args.data,
            updated_by: id,
          },
        },
        { headers }
      );

      if (response.data.success) {
        return response.data.data;
      }

      throw { statusCode: response.status, message: response.data.msg };
    },
    errorHandler
  ),

  updateUserPassword: catchGraphQLResolverErrors(
    async (parent, args, { req }) => {
      const id = await getUserId(req);
      if (id == null) {
        throw { statusCode: 401, message: "unauthorized" };
      }

      const headers = { Authorization: id };
      const response = await axios.patch(
        `${AUTHSERVICE}/updatePassword/${id}`,
        {
          type: "updatePassword",
          data: {
            password: args.data.password,
            updated_by: id,
          },
        },
        { headers }
      );

      if (response.data.success) {
        return response.data.data;
      }

      throw { statusCode: response.status, message: response.data.msg };
    },
    errorHandler
  ),


  resetPassword: catchGraphQLResolverErrors(
    async (parent, args, { pubsub, req }) => {
      const findUsersEmail = await User.findOne({ email: args.email }).exec();
      if (findUsersEmail == null) {
        throw { statusCode: 404, message: "could not reset password" };
      }

      const response = await axios.post(`${AUTHSERVICE}/resetPassword`, {
        type: "resetPassword",
        data: {
          email: args.email,
        },
      });

      if (response.data.success) {
        return response.data.data;
      }

      throw { statusCode: response.status, message: response.data.msg };
    },
    errorHandler
  ),
};

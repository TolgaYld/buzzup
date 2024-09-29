const { getUserId } = require("@TolgaYld/core-buzzup");
const createError = require("http-errors");
const axios = require("axios");
const errorHandler = require("../../../errors/errorHandler");
const { User, AUTHSERVICE } = require("@TolgaYld/core-buzzup");

module.exports = {
  signUpUser: async (parent, args, { pubsub, req }) => {
    console.log(AUTHSERVICE);
    try {
      const response = await axios.post(
        AUTHSERVICE + "/signUp",
        {
          type: "signUpUser",
          data: {
            ...args.data,
            email_confirmed: false,
            is_admin: false,
          },
        },
      );
      if (response.data.success) {
        return response.data.data;
      } else {
        // errorHandler(response.status, response.data.msg);

        throw Error(createError(response.status, response.data.msg));
      }
    } catch (error) {
      console.log(error);
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(createError(error.response.status, error.response.data.msg));
    }
  },

  authUserWithProvider: async (parent, args, { pubsub, req }) => {
    try {
      const response = await axios.post(
        AUTHSERVICE + "/authWithProvider",
        {
          type: "authUserWithProvider",
          data: {
            ...args.data,
            email_confirmed: false,
            is_admin: false,
          },
        },
      );
      if (response.data.success) {
        return response.data.data;
      } else {
        // errorHandler(response.status, response.data.msg);
        throw Error(createError(response.data.msg));
      }
    } catch (error) {
      // errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },

  signInUser: async (
    parent,
    { data: { emailOrUsername, password } },
    { req },
  ) => {
    try {

      const response = await axios.post(
        AUTHSERVICE + "/signIn",
        {
          type: "signInUser",
          data: {
            emailOrUsername,
            password,
          },
        },
      );

      if (response.data.success) {
        return response.data.data;
      } else {
        console.log(response);
        errorHandler(response.status, response.data.msg);
        throw Error(createError(response.status, response.data.msg));
      }
    } catch (error) {
      // errorHandler(error.response.status, error.response.data.msg);
      throw Error(createError(error.response.status, error.response.data.msg));
    }
  },

  deleteUser: async (parent, args, { req }) => {
    try {
      const id = await getUserId(req);
      if (id == null) {
        throw Error(createError(401, "unauthorized"));
      } else {
        const findUser = await User.findById(id).exec();

        if (!findUser) {
          throw Error(createError(401, "unauthorized"));
        } else {
          const headers = {
            Authorization: id,
          };

          const response = await axios.patch(
            AUTHSERVICE + "/update/" + args.id,
            {
              type: "updateUser",
              data: {
                is_deleted: true,
                last_update_from_user: id,
              },
            },
            { headers },
          );

          if (response.data.success) {
            return response.data.data;
          } else {
            errorHandler(response.status, response.data.msg);
            throw Error(createError(response.status, response.data.msg));
          }
        }
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },

  deleteUserFromDb: async (parent, args, { req }) => {
    try {
      const id = await getUserId(req);

      if (id == null) {
        throw Error(createError(401, "unauthorized"));
      } else {
        const findUser = await User.findById(id).exec();

        if (!findUser) {
          throw Error(createError(401, "unauthorized"));
        } else {
          const headers = {
            Authorization: id,
          };

          const response = await axios.delete(
            AUTHSERVICE + "/delete/" + args.id,
            {
              type: "DeleteUserFromDb",
              headers,
            },
          );
          if (response.data.success) {
            return "User: " + args.id + " deleted";
          } else {
            errorHandler(response.status, response.data.msg);
            throw Error(createError(response.status, response.data.msg));
          }
        }
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },

  updateUser: async (parent, args, { req }) => {
    try {
      const id = await getUserId(req);
      if (id == null) {
        throw Error(createError(401, "unauthorized"));
      } else {
        const findUser = await User.findById(id).exec();
        if (!findUser) {
          throw Error(createError(401, "unauthorized"));
        } else {
          const headers = {
            Authorization: id,
          };

          const response = await axios.patch(
            AUTHSERVICE + "/update/" + id,
            {
              type: "updateUser",
              data: {
                ...args.data,
                last_update_from_user: id,
              },
            },
            { headers },
          );

          if (response.data.success) {
            return response.data.data;
          } else {
            errorHandler(response.status, response.data.msg);
            throw Error(createError(response.status, response.data.msg));
          }
        }
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },

  updateUserPassword: async (parent, args, { req }) => {
    try {
      const id = await getUserId(req);

      if (id == null) {
        throw Error(createError(401, "unauthorized"));
      } else {
        const findUser = await User.findById(id).exec();
        if (!findUser) {
          throw Error(createError(401, "unauthorized"));
        } else {
          const headers = {
            Authorization: id,
          };

          const response = await axios.patch(
            AUTHSERVICE + "/updatePassword/" + id,
            {
              type: "updatePassword",
              data: {
                password: args.data.password,
                last_update_from_user: id,
              },
            },
            { headers },
          );

          if (response.data.success) {
            return response.data.data;
          } else {
            errorHandler(response.status, response.data.msg);
            throw Error(createError(response.status, response.data.msg));
          }
        }
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },

  resetPassword: async (parent, args, { pubsub, req }) => {
    try {
      const findUsersEmail = await User.findOne({
        email: args.email,
      }).exec();
      if (!findUsersEmail) {
        throw Error(createError(401, "could not reset password"));
      } else {
        const response = await axios.post(
          AUTHSERVICE + "/resetPassword",
          {
            type: "resetPassword",
            data: {
              email: args.email,
            },
          },
        );

        if (response.data.success) {
          return response.data.data;
        } else {
          errorHandler(response.status, response.data.msg);
          throw Error(createError(response.status, response.data.msg));
        }
      }
    } catch (error) {
      errorHandler(error.response.status, error.response.data.msg);
      throw Error(error.response.data.msg);
    }
  },
};

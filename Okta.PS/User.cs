using Okta.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Okta.PS
{
    public class User
    {
        private Okta.Sdk.IUser OktaSdkUser { get; set; }

        public string FirstName => OktaSdkUser.Profile.FirstName;
        public string LastName => OktaSdkUser.Profile.LastName;
        public string Login => OktaSdkUser.Profile.Login;
        public string Email => OktaSdkUser.Profile.Email;
        public DateTimeOffset? Activated => OktaSdkUser.Activated;
        public DateTimeOffset? Created => OktaSdkUser.Created;
        public Okta.Sdk.IUserCredentials Credentials => OktaSdkUser.Credentials;
        public string Id => OktaSdkUser.Id;
        public DateTimeOffset? LastLogin => OktaSdkUser.LastLogin;
        public DateTimeOffset? LastUpdated => OktaSdkUser.LastUpdated;
        public DateTimeOffset? PasswordChanged => OktaSdkUser.PasswordChanged;
        public Okta.Sdk.IUserProfile Profile => OktaSdkUser.Profile;
        public Okta.Sdk.UserStatus Status { get { return OktaSdkUser.Status; } }
        public DateTimeOffset? StatusChanged { get { return OktaSdkUser.StatusChanged; } }
        public Okta.Sdk.UserStatus TransitioningToStatus { get { return OktaSdkUser.TransitioningToStatus; } }

        public User(Okta.Sdk.IUser oktaSdkUser)
        {
            OktaSdkUser = oktaSdkUser;
        }

        public static async Task<Okta.Sdk.IUser> GetCurrentUser(OktaClient client)
        {
            Okta.Sdk.IUser u = await client.GetAsync<Okta.Sdk.User>(new HttpRequest { Uri = "/api/v1/users/me" });
            return u;
        }

        public static async Task<Okta.Sdk.IUser> GetUser(OktaClient client, string identity)
        {
            Okta.Sdk.IUser u = await client.Users.GetUserAsync(identity);
            return u;
        }

        public static async Task<List<Okta.Sdk.IUser>> FilterUsers(OktaClient client, string filter)
        {
            List<Okta.Sdk.IUser> u = await client.Users.ListUsers(filter: filter).ToList();
            return u;
        }

        public static async Task<List<Okta.Sdk.IUser>> GetAllUsers(OktaClient client)
        {
            List<Okta.Sdk.IUser> u = await client.Users.ListUsers().ToList();
            return u;
        }
    }
}

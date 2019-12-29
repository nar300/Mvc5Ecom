﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace OnlineShoppingStoreMVCUsingLinq.BO
{
    public class UserProfileBO
    {
        OnlineShoppingStoreEntities1 context = new OnlineShoppingStoreEntities1();
        public UserProfile GetUser(int userId)
        {
            return context.UserProfiles.Where(u => u.PKUserId == userId).SingleOrDefault();
        }

        public UserProfile AuthenticateUser(string userName)
        {
            try
            {
                UserProfile objUserProfile = context.UserProfiles.Where(u => u.UserName == userName).SingleOrDefault();
                return objUserProfile;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<UserProfile> GetUsers(string emailId = "", string mobileNo = "", DateTime? fromDate = null, DateTime? toDate = null, bool? isActive = null)
        {
            try
            {
                IQueryable<UserProfile> qry = context.UserProfiles;
                if (emailId != "")
                    qry = qry.Where(u => u.EmailId.Contains(emailId));
                if (mobileNo != "")
                    qry = qry.Where(u => u.MobileNo.Contains(mobileNo));
                if (fromDate.HasValue && toDate.HasValue)
                    qry = qry.Where(u => u.CreatedDate >= fromDate.Value && u.CreatedDate <= toDate.Value);
                if (isActive != null)
                    qry = qry.Where(u => u.IsActive == isActive);
                return qry.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void InsertUser(UserProfile objUser)
        {
            try
            {
                objUser.CreatedDate = DateTime.Now;
                if (!string.IsNullOrEmpty(Helper.UserData))
                    objUser.CreatedByUserId = Helper.UserId;
                context.UserProfiles.Add(objUser);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void UpdateUser(UserProfile objUser)
        {
            try
            {
                objUser.UpdatedDate = DateTime.Now;
                objUser.UpdatedByUserId = Helper.UserId;
                context.Entry(objUser).State = EntityState.Modified;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void DeleteUser(int userId)
        {
            try
            {
                UserProfile objUser = context.UserProfiles.Find(userId);
                context.UserProfiles.Remove(objUser);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
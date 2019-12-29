using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace OnlineShoppingStoreMVCUsingLinq.BO
{
    public class UserLoginHistoryBO
    {
        OnlineShoppingStoreEntities1 context = new OnlineShoppingStoreEntities1();
        public UserLoginHistory GetUserLoginHistory(int userId)
        {
            return context.UserLoginHistories.Where(u => u.FKUserId == userId).SingleOrDefault();
        }
        public List<UserLoginHistory> GetUserLoginHistories(int userId = 0)
        {
            try
            {
                IQueryable<UserLoginHistory> qry = context.UserLoginHistories;
                if (userId != 0)
                {
                    return context.UserLoginHistories.Where(u => u.FKUserId == userId).ToList();
                }
                else
                {
                    return context.UserLoginHistories.ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void InsertUserLoginHistory(UserLoginHistory objUserLoginHistory)
        {
            try
            {
                objUserLoginHistory.LoginDateTime = DateTime.Now;
                context.UserLoginHistories.Add(objUserLoginHistory);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void UpdateUserLoginHistory(UserLoginHistory objUserLoginHistory)
        {
            try
            {
                context.Entry(objUserLoginHistory).State = EntityState.Modified;
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void DeleteUserLoginHistory(int userLoginHistoryId)
        {
            try
            {
                UserLoginHistory objUserLoginHistory = context.UserLoginHistories.Find(userLoginHistoryId);
                context.UserLoginHistories.Remove(objUserLoginHistory);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
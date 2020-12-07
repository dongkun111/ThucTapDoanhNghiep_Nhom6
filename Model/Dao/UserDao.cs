using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Dao;
using Model.EF;

namespace Model.Dao
{
    public class UserDao
    {
       QLGameEntities db = null;
        public UserDao()
        {
            db = new QLGameEntities();
        }
        public int Insert(TaiKhoan entity)
        {
            db.TaiKhoans.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public TaiKhoan GetById(string userName)
        {
            return db.TaiKhoans.SingleOrDefault(x => x.Username == userName);
        }
        public int Login(string userName, string passWord)
        {
            var result = db.TaiKhoans.SingleOrDefault(x=>x.Username==userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Password == passWord)
                    return 1;
                else
                    return -1;                
            }
        }
    }
}

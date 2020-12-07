using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class BinhLuanDao
    {
        QLGameEntities g = null;
        public BinhLuanDao()
        {
            g = new QLGameEntities();
        }
        public bool Insert(BinhLuan bl)
        {
            try
            {
                bl.IDKhach = 1;
                bl.IDGame = 1;
                g.BinhLuans.Add(bl);
                g.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        public List<BinhLuan> ListBL()
        {
            return g.BinhLuans.ToList();
        }
    }
}

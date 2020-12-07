using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class KhachDao
    {
        QLGameEntities g = null;
        public KhachDao()
        {
            g = new QLGameEntities();
        }
        public bool CheckKhach( string userName)
        {
            return g.KhachHangs.Count(x => x.Username == userName) > 0;
        }
        public int LoginKhach(string name,string pass)
        {
            var kq = g.KhachHangs.SingleOrDefault(x => x.Username == name);
            if (kq == null)
                return 0;
            else
            {
                if (kq.Password == pass)
                    return 1;
                else
                    return -1;
            }
        }
        public KhachHang getKhach(string userName)
        {
            return g.KhachHangs.SingleOrDefault(x => x.Username == userName);
        }
        public KhachHang GetKhachByID(int id)
        {
            KhachHang khach = g.KhachHangs.Find(id);
            return khach;
        }
        public List<KhachHang> GetKhachHang()
        {
            return g.KhachHangs.ToList();
        }
        public bool Insert(KhachHang customer)
        {
            try
            {
                g.KhachHangs.Add(customer);
                g.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

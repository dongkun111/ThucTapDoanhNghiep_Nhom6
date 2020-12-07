using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class ThongTinDao
    {
        QLGameEntities g = null;
        public ThongTinDao()
        {
            g = new QLGameEntities();
        }
        public List<KhachHang> GetByKhachID(int id)
        {
            return g.KhachHangs.Where(x => x.ID == id).ToList();
        }
        public List<KhachHang> GetTT()
        {
            return g.KhachHangs.ToList();
        }
    }
}

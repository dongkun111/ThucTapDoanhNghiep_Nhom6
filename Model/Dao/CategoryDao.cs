using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class CategoryDao
    {
        QLGameEntities g = null;
        public CategoryDao()
        {
            g = new QLGameEntities();
        }
        public List<GameCategory> ListAll()
        {
            return g.GameCategories.ToList();
        }
    }
}

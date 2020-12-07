using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
     public class MenuDao
    {
        QLGameEntities g = null;
        public MenuDao()
        {
            g = new QLGameEntities();
        }
        public List<Menu> ListbyGroupID()
        {
            return g.Menus.ToList();
        }
        public List<MenuType> GetList()
        {
            return g.MenuTypes.ToList();
        }
        public List<Menu> MenuChinh()
        {
            return g.Menus.Where(x => x.Submenu == null && x.Multilevel == true).ToList();
        }
        public bool InsertMenu(Menu menu)
        {
            try
            {
                g.Menus.Add(menu);
                g.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        public bool UpdateMenu(Menu menu)
        {
            try
            {
                var tenmenu = g.Menus.Find(menu.ID);
                tenmenu.Text = menu.Text;
                tenmenu.Link = menu.Link;
                tenmenu.Target = menu.Target;
                tenmenu.TypeID = menu.TypeID;
                tenmenu.Status = menu.Status;
                tenmenu.Submenu = menu.Submenu;
                tenmenu.Multilevel = menu.Multilevel;
                tenmenu.MenuType = menu.MenuType;                
                g.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var menu = g.Menus.Find(id);
                g.Menus.Remove(menu);
                g.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}

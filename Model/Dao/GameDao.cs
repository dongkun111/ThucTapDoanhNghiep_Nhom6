using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Dao;
using Model.EF;
using TaiGameMP.ViewModel;

namespace Model.Dao
{
    public class GameDao
    {
        QLGameEntities g = null;
        public GameDao()
        {
            g = new QLGameEntities();
        }
        public Game GetGame(int id)
        {
            return g.Games.Find(id);
        }
        public List<Game> ListGame()
        {
            return g.Games.ToList();
        }
        public List<Game> ListGamebyID(int id)
        {
            return g.Games.Where(x=>x.IDCategory == id).ToList();
        }
        public List<Game> ListGameA()
        {
            return g.Games.OrderBy(x=>x.ID).Take(9).ToList();
        }
        public List<Game> TopGame()
        {
            return g.Games.OrderByDescending(x => x.ID).Take(6).ToList();
        }
        public List<string> ListName(string keyword)
        {
            return g.Games.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }
        public List<GameView> Search(string keyword)
        {

            var model = (from a in g.Games
                         join b in g.GameCategories
                         on a.IDCategory equals b.ID
                         where a.Name.Contains(keyword)
                         select new
                         {
                             ID = a.ID,
                             CateName = b.Name,
                             UrlTitle = a.UnTitle,
                             Detail = a.Detail,
                             Description = a.Description,
                             Name = a.Name,
                             Image = a.Image,

                         }).AsEnumerable().Select(x => new GameView()
                         {
                             ID = x.ID,
                             CateName = x.Name,
                             UrlTitle = x.UrlTitle,
                             Detail = x.Detail,
                             Description = x.Description,
                             Name = x.Name,
                             Image = x.Image,
                         });
            //model.OrderByDescending(x => x.ID).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }
        public List<Game> RelatedGame(int id)
        {
            var game = g.Games.Find(id);
            return g.Games.Where(x => x.ID != id && x.IDCategory == game.IDCategory).ToList();
        }
        public Game Viewdetail(int id)
        {
            return g.Games.Find(id);
        }
        public int InsertGame(Game game)
        {
            g.Games.Add(game);
            g.SaveChanges();
            return game.ID;
        }
        public bool UpdateGame(Game game)
        {
            try
            {
                var tengame = g.Games.Find(game.ID);
                tengame.Name = game.Name;
                tengame.UnTitle = game.UnTitle;
                tengame.IDCategory = game.IDCategory;
                tengame.Code = game.Code;
                tengame.Description = game.Description;
                tengame.Image = game.Image;
                tengame.MoreImage = game.MoreImage;
                tengame.Detail = game.Detail;
                tengame.ViewCount = game.ViewCount;
                tengame.Quatity = game.Quatity;
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
                var game = g.Games.Find(id);
                g.Games.Remove(game);
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

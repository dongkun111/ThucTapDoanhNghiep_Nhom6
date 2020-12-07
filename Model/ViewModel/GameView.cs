using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaiGameMP.ViewModel
{
    public class GameView
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string CateName { get; set; }
        public string UrlTitle { get; set; }
        public string UnTitle { get; set; }
        public Nullable<int> IDCategory { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public string MoreImage { get; set; }
        public string Detail { get; set; }
        public Nullable<int> ViewCount { get; set; }
        public Nullable<int> Quatity { get; set; }

        public virtual GameCategory GameCategory { get; set; }
    }
}
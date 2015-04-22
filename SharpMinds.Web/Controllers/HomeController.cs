using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SharpMinds.Web.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using SharpMinds.Web.Helper;
using System.Threading.Tasks;

namespace SharpMinds.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public async Task<ActionResult> Questions(int tagId)
        {
            List<Question> qList = await GetQuestions(tagId);
            return View(qList);
        }

        //public async Task <ActionResult> GetTags()
        //{
        //    ApiHelper<List<Tag>> helperObj = new ApiHelper<List<Tag>>(new Uri("http://localhost:64162/"));
        //    List<Tag> tagList;
        //    tagList = await helperObj.Get(@"api/Service/GetTags");

        //    return View("ShowCategories",tagList);
        //}

        public async Task<ActionResult> GetCategories()
        {
            ApiHelper<List<Category>> helperObj = new ApiHelper<List<Category>>(new Uri("http://localhost:64162/"));
            List<Category> tagList;
            tagList = await helperObj.Get(@"api/Service/GetCategories");

            return Json(tagList.Select(x => new { Value = x.CategoryId,Text = x.CategoryName}), JsonRequestBehavior.AllowGet);
        }

        public async Task<ActionResult> GetTags(int categoryId)
        {
            ApiHelper<List<Tag>> helperObj = new ApiHelper<List<Tag>>(new Uri("http://localhost:64162/"));
            List<Tag> tagList;
            tagList = await helperObj.Get(@"api/Service/GetTagsByCategory?categoryId=" + categoryId);

            return Json(tagList.Select(x => new { Value = x.TagId, Text = x.TagName }), JsonRequestBehavior.AllowGet);
        }

        public async Task<List<Question>> GetQuestions(int tagId)
        {
            ApiHelper<List<Question>> helperObj = new ApiHelper<List<Question>>(new Uri("http://localhost:64162/"));
            List<Question> tagList;
            tagList = await helperObj.Get(@"api/Service/GetQuestionsByTag?tagId=" + tagId);

            return tagList;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SharpMinds.WebService.Data;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Entity.Core.EntityClient;
using System.Data.Entity;

namespace SharpMinds.WebService.Controllers
{
    public class ServiceController : ApiController
    {
        private SharpMindsContext context;// = new SharpMindsContext();
        public ServiceController()
        {
            context = new SharpMindsContext();
        }


        public IEnumerable<Category> GetCategories()
        {
            return context.Categories
                .Select(x => new Category { CategoryId = x.CategoryId, CategoryName = x.CategoryName, Tags = x.Tags
                    .Select(y => new Tag { TagId = y.TagId,TagName = y.TagName,CategoryId = y.CategoryId}).ToList() });
        }

        /// <summary>
        /// Gets all the Tags
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Tag> GetTags()
        {
            using (context)
            {
               
                List<Tag> tagList = new List<Tag>();
                var values = context.Tags.Select(x => new Tag { TagId = x.TagId, TagName = x.TagName, CategoryId = x.CategoryId }).ToList();

                return values;
            }   
        }
        /// <summary>
        /// Get Category By Tag
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        public IEnumerable<Tag> GetTagsByCategory(int categoryId)
        {
            using (context)
            {
                return context.Tags
                    .Where(x => x.CategoryId == categoryId)
                    .Select(x => new Tag { TagId=x.TagId,TagName = x.TagName,CategoryId = categoryId}).ToList();
            }
        }

        public IEnumerable<Question> GetQuestionsByTag(int tagId)
        {
            using (context)
            {
                List<Question > questionList = context.Questions.Where(x => x.TagId == tagId).Select(x => new Question { CategoryId = x.Tag.CategoryId, Query = x.Query, QuestionId = x.QuestionId, TagId = x.TagId, Options = x.Options.Select(y => new Option { OptionId =y.OptionId,OptionValue = y.OptionValue, IsCorrect =y.IsCorrect}).ToList() }).ToList();
                return questionList;
            }
        }

        public Question GetRandomQuestion()
        {
            Question question = context.Questions.OrderBy(x => Guid.NewGuid()).Select(x => new Question { Query = x.Query, CategoryId = x.Tag.CategoryId, TagId = x.TagId, QuestionId = x.QuestionId, Options = x.Options.Select(y => new Option { OptionId =y.OptionId,IsCorrect=y.IsCorrect,OptionValue= y.OptionValue}).ToList() }).FirstOrDefault();

            return question;
        }

        public IEnumerable<Question> GetQuestionsByCategory(int categoryId)
        {
            return context.Questions
                .Where(x => x.Tag.CategoryId==categoryId)
                .Select(x => new Question { CategoryId = x.Tag.CategoryId, Query = x.Query, QuestionId = x.QuestionId, TagId = x.TagId, Options = x.Options
                    .Select(y => new Option { OptionId = y.OptionId, OptionValue = y.OptionValue, IsCorrect = y.IsCorrect })
                    .ToList() })
                    .ToList();
        }
    }
}

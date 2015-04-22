using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;

namespace SharpMinds.Web.Helper
{
    public class ApiHelper<T> where T :class
    {
        public ApiHelper(Uri baseUri)
        {
            _baseUri = baseUri;
        }

        private Uri _baseUri { get; set; }
        public async Task<T> Get( string urltoGet) 
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = _baseUri;
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = await client.GetAsync(urltoGet);
            if (response.IsSuccessStatusCode)
            {
                T TObject = await response.Content.ReadAsAsync<T>();
                return TObject;
            }
            else
            {
                throw new Exception("Some Error Occured");
            }
        }
    }
}
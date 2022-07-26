using System;

namespace Entities.Helpers
{
    public static class ApiRoutes
    {
        private static readonly string _baseUrl = "https://localhost:44391/";
        public static class ProductService
        {
            public static readonly string GetItemFila = String.Concat(_baseUrl, "ControleFila/GetItemFila");
        }
    }
}

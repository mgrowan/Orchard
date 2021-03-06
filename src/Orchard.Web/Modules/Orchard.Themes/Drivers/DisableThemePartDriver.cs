﻿using System.Web;
using JetBrains.Annotations;
using Orchard.ContentManagement.Drivers;
using Orchard.Themes.Models;

namespace Orchard.Themes.Drivers {
    [UsedImplicitly]
    public class DisableThemePartDriver : ContentPartDriver<DisableThemePart> {
        private readonly HttpContextBase _httpContext;

        public DisableThemePartDriver(HttpContextBase httpContext) {
            _httpContext = httpContext;
        }

        protected override DriverResult Display(DisableThemePart part, string displayType, dynamic shapeHelper) {
            return ContentShape("Parts_DisableTheme", () => {
                ThemeFilter.Disable(_httpContext.Request.RequestContext);
                return null;
            });
        }
    }

}
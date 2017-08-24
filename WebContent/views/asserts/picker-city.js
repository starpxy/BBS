+function (a) {
    a.rawCitiesData = rawUniversitiesData
}($), +function (a) {
    "use strict";
    var b;
    a.fn.cityPicker = function (c) {
        return c = a.extend({}, b, c), this.each(function () {
            var o, p, q, b = function (a) {
                var c, d, b = [];
                for (c = 0; c < a.length; c++)d = a[c], "请选择" !== d.name && b.push(d.name);
                return b.length ? b : [""]
            }, d = function (a) {
                return a.sub ? b(a.sub) : [""]
            }, e = function (a) {
                for (var b = 0; b < g.length; b++)if (g[b].name === a)return d(g[b]);
                return [""]
            }, f = function (a, b) {
                var c, e;
                for (c = 0; c < g.length; c++)if (g[c].name === a)for (e = 0; e < g[c].sub.length; e++)if (g[c].sub[e].name === b)return d(g[c].sub[e]);
                return [""]
            }, g = a.rawCitiesData, h = g.map(function (a) {
                return a.name
            }), i = d(g[0]), j = d(g[0].sub[0]), k = h[0], l = i[0], m = j[0], n = [{
                values: h,
                cssClass: "col-province"
            }, {values: i, cssClass: "col-city"}];
            c.showDistrict && n.push({values: j, cssClass: "col-district"}), o = {
                cssClass: "city-picker",
                rotateEffect: !1,
                onChange: function (a) {
                    var h, i, j, g = a.cols[0].value;
                    return g !== k ? (i = e(g), h = i[0], j = f(g, h), a.cols[1].replaceValues(i), c.showDistrict && a.cols[2].replaceValues(j), k = g, l = h, a.updateValue(), void 0) : (c.showDistrict && (h = a.cols[1].value, h !== l && (a.cols[2].replaceValues(f(g, h)), l = h, a.updateValue())), void 0)
                },
                cols: n
            }, this && (p = a.extend(o, c), q = a(this).val(), q && (p.value = q.split(" "), p.value[0] && (k = p.value[0], p.cols[1].values = e(p.value[0])), p.value[1] ? (l = p.value[1], c.showDistrict && (p.cols[2].values = f(p.value[0], p.value[1]))) : (m = p.value[2], c.showDistrict && (p.cols[2].values = f(p.value[0], p.cols[1].values[0])))), a(this).picker(p))
        })
    }, b = a.fn.cityPicker.prototype.defaults = {showDistrict: !0}
}($);
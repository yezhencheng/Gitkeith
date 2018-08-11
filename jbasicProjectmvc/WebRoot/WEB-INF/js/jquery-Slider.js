(function(a) {
	a.fn.Scroll = function() {
		var l = a("#btnDown");
		var f = a("#btnUp");
		var g = this.eq(0).find("ul:first");
		var n = 40;
		var q = 1;
		var d = 500;
		var e = q;
		var h = g.find(".parentMenu").length;
		var k = q * n;
		var i = 0;
		j(0);

		function b() {
			if (!g.is(":animated")) {
				if (e < h - 5) {
					e += q;
					g.animate({
						marginTop: "-=" + k + "px"
					}, d);
					i = i + 1;
					j(i)
				} else {
					l.removeClass("hover")
				}
			}
		}
		function j(u) {
			for (var s = 1; s <= h; s++) {
//				if (s - u == 7) {
//					a(".secondFLoat" + s).css("bottom", "0px");
//					a(".secondFLoat" + s).css("top", "auto")
//				} else {
					var m = a(".secondFLoat" + s).height();
					var r = 520 - (s - u - 1) * n;
					if (m > r) {
						var t = (s - u - 1) * n - (m - r) + 20
					} else {
						var t = (s - u - 1) * n + 20
					}
					a(".secondFLoat" + s).css("top", t + "px")
//				}
			}
		}
		function o() {
			if (!g.is(":animated")) {
				if (e > q) {
					e -= q;
					g.animate({
						marginTop: "+=" + k + "px"
					}, d);
					i = i - 1;
					j(i)
				} else {
					f.removeClass("hover")
				}
			}
		}
		function p() {}
		l.mouseover(function() {
			if (!g.is(":animated")) {
				if (e < h - 6) {
					l.addClass("hover")
				}
			}
		});
		l.mouseout(function() {
			l.removeClass("hover")
		});
		f.mouseover(function() {
			if (!g.is(":animated")) {
				if (e > q) {
					f.addClass("hover")
				}
			}
		});
		f.mouseout(function() {
			f.removeClass("hover")
		});
		l.bind("click", b);
		f.bind("click", o)
	}
})(jQuery);
$(function() {});
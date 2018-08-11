
function setdownArrow() {
	var a = $(".tabs li:last").offset().left + 1;
	var b = $(".tabs li:last").width();
	$(".downArrow").css("left", (a + b) + "px")
}
function ShowMsg(a) {
	$(".errorInfo").text(a);
	$(".errorInfo").show().delay(3000).fadeOut(200)
}
function addTab(d, b) {
	if ($("#tabs").tabs("exists", d)) {
		$("#tabs").tabs("select", d);
		var a = $("#tabs").tabs("getSelected");
		var b = $(a.panel("options").content).attr("src");
		if (b != undefined && a.panel("options").title != "欢迎页") {
			$("#divLoading").show();
			$("#tabs").tabs("update", {
				tab: a,
				options: {
					content: createFrame(b)
				}
			})
		}
	} else {
		var c = createFrame(b);
		$("#tabs").tabs("add", {
			title: d,
			content: c,
			closable: true
		})
	}
	tabClose();
	if (d != "欢迎页") {
		setdownArrow()
	}
}
function SelectTable(c, b, d) {
	if ($("#tabs").tabs("exists", c)) {
		var a = $("#tabs").tabs("select", c)
	} else {
		addTab1(c, b, $("div[topname='" + d + "']").attr("topvalue"))
	}
}
function addTab1(g, d, e) {
	var c = true;
	if (g == "欢迎页" || g == "录入期初数据") {
		c = false
	}
	$("#divLoading").show();
	$(".parentMenu").removeClass("menuS");
	$("#parent" + e).addClass("menuS");
	$("#hidCurTopMenuId").val(e);
	if ($("#tabs").tabs("exists", g)) {
		$("#tabs").tabs("select", g);
		var b = $("#tabs").tabs("getSelected");
		var a = $(b.panel("options").content).attr("src");
		if (a != undefined && b.panel("options").title != "欢迎页") {
			$("#divLoading").show();
			$("#tabs").tabs("update", {
				tab: b,
				options: {
					content: createFrame(d)
				}
			})
		}
	} else {
		var f = createFrame(d);
		$("#tabs").tabs("add", {
			title: g,
			content: f,
			closable: c,
			id: e
		})
	}
	tabClose();
	if (g != "欢迎页") {
		setdownArrow()
	}
}
function childAddTab(b, a, c) {
	addTab1(b, a, $("div[topname='" + c + "']").attr("topvalue"))
}
function createFrame(a) {
	var b = '<iframe scrolling="auto" frameborder="0"  src="' + a + '" style="width:100%;height:100%;"></iframe>';
	return b
}
function CloseTab() {
	parent.$.messager.confirm("系统提示", "提示：确定要关闭当前页面吗？", function(b) {
		if (b) {
			var a = $("#tabs").tabs("getSelected");
			$("#tabs").tabs("close", a.panel("options").title);
			setdownArrow()
		}
	})
}
function CloseTabByTitle(a) {
	$("#tabs").tabs("close", a);
	setdownArrow()
}
function childAddTabAndCloseTab(c, a, d, b) {
	$("#tabs").tabs("close", b);
	addTab1(c, a, $("div[topname='" + d + "']").attr("topvalue"))
}
function tabCloseFun(b) {
	var a = $(b).parent().children(".tabs-inner").children(".tabs-title").text();
	return
}
function tabClose() {
	$(".tabs-inner").click(function() {
		var a = $(this).children(".tabs-closable").text();
		$(".parentMenu").removeClass("menuS");
		if (a != null && a != "") {
			var b = $("#tabs").tabs("getTab", a);
			$("#parent" + b.panel("options").id).addClass("menuS");
			$("#hidCurTopMenuId").val(b.panel("options").id)
		}
	});
	$(".tabs-close").click(function() {
		var a = $(this).parent().find(".tabs-closable").text();
		$("#tabs").tabs("close", a);
		setdownArrow();
		return false
	});
	$(".tabs-inner").dblclick(function() {
		var a = $(this).children(".tabs-closable").text();
		$("#tabs").tabs("close", a);
		setdownArrow()
	})
}
function UpdateTabFirst() {
	var b = $("#tabs").tabs("getTab", "欢迎页");
	var a = $(b.panel("options").content).attr("src");
	var c = '<iframe scrolling="auto" frameborder="0"  src="' + a + '" style="width:100%;height:100%;"></iframe>';
	if (a != undefined) {
		$("#tabs").tabs("update", {
			tab: b,
			options: {
				content: c
			}
		});
		var d = navigator.userAgent;
		if (d.indexOf("MSIE 6.0") > -1 || d.indexOf("Chrome") > -1) {
			var e = $("#tabs").tabs("getTab", "欢迎页");
			setTimeout(function() {
				refreshTab(e)
			}, 0)
		}
	}
}
function refreshTab(c) {
	if (c && c.find("iframe").length > 0) {
		var a = c.find("iframe")[0];
		var b = a.src;
		a.contentWindow.location.href = b
	}
}
function tabCloseEven() {
	$("#mm-tabupdate").click(function() {
		var a = $("#tabs").tabs("getSelected");
		var b = $(a.panel("options").content).attr("src");
		if (b != undefined) {
			$("#divLoading").show();
			$("#tabs").tabs("update", {
				tab: a,
				options: {
					content: createFrame(b)
				}
			})
		}
	});
	$("#mm-tabclose").click(function() {
		var a = $("#mm").data("currtab");
		$("#tabs").tabs("close", a);
		setdownArrow()
	});
	$("#mm-tabcloseall").click(function() {
		$(".tabs-inner span").each(function(b, c) {
			var a = $(c).text();
			if (a != "欢迎页") {
				$("#tabs").tabs("close", a)
			}
		});
		setdownArrow()
	});
	$("#mm-tabcloseother").click(function() {
		var b = $(".tabs-selected").prevAll();
		var a = $(".tabs-selected").nextAll();
		if (b.length > 0) {
			b.each(function(d, e) {
				var c = $("a:eq(0) span", $(e)).text();
				if (c != "欢迎页") {
					$("#tabs").tabs("close", c)
				}
			})
		}
		if (a.length > 0) {
			a.each(function(d, e) {
				var c = $("a:eq(0) span", $(e)).text();
				if (c != "欢迎页") {
					$("#tabs").tabs("close", c)
				}
			})
		}
		setdownArrow();
		return false
	});
	$("#mm-tabcloseright").click(function() {
		var a = $(".tabs-selected").nextAll();
		if (a.length == 0) {
			alert("后边没有啦~~");
			return false
		}
		a.each(function(c, d) {
			var b = $("a:eq(0) span", $(d)).text();
			$("#tabs").tabs("close", b)
		});
		return false
	});
	$("#mm-tabcloseleft").click(function() {
		var a = $(".tabs-selected").prevAll();
		if (a.length == 0) {
			alert("到头了，前边没有啦~~");
			return false
		}
		a.each(function(c, d) {
			var b = $("a:eq(0) span", $(d)).text();
			$("#tabs").tabs("close", b)
		});
		return false
	});
	$("#mm-exit").click(function() {
		$("#mm").menu("hide")
	})
}
function LoadByPwd() {
	$("#win").dialog({
		title: "登录已超时，请重新输入密码：",
		width: 300,
		height: 150,
		closed: false,
		cache: false,
		closable: false,
		href: "/admin/login.html",
		modal: true
	})
}
$(function() {
	eval("");
	document.onkeydown = function(e) {
		var ev = document.all ? window.event : e;
		if (ev.keyCode == 13) {
			if ($(document.activeElement).parent().parent().parent().find(".button").first()) {
				$(document.activeElement).parent().parent().parent().find(".button").first().click()
			} else {
				if (typeof($("#tabs .panel:visible iframe")[0]) != "undefined" && $("#tabs .panel:visible iframe")[0].contentWindow.$(".blueButton").first().html() != null) {
					$("#tabs .panel:visible iframe")[0].contentWindow.$(".blueButton").first().click()
				}
			}
		}
	};
	tabCloseEven();
	$(".parentMenu").mouseenter(function() {
		OpenSecondMenu($(this).attr("id").replace("parent", ""))
	});
	$(".parentMenu").mouseleave(function() {
		TopMenuMouseOut()
	});
	$(".memberInfo").mouseenter(function() {
		$(".MImore").fadeIn(250)
	});
	$(".memberInfo").mouseleave(function() {
		$(".MImore").fadeOut(250)
	});
	childAddTab("欢迎页", "welcome.jsp", "");
	$(".tabs-inner span").each(function(i, n) {
		var t = $(n).text();
		if (t != "欢迎页") {
			$("#tabs").tabs("close", t)
		}
	})
});

function OpenSecondMenu(a) {
	$(".parentMenu").removeClass("menuS");
	$("#parent" + a).addClass("menuS");
	$("#" + a).show()
}
function OpenWindow(d) {
	var a = "1";
	var c = $(d);
	var b = c.attr("src");
	var e = c.text();
	addTab1(e, b, c.attr("index"));
	$(".secondFloat").hide()
}
function TopMenuMouseOut() {
	$(".parentMenu").removeClass("menuS");
	$("#parent" + $("#hidCurTopMenuId").val()).addClass("menuS");
	$(".secondFloat").hide()
}
function userPwd() {
	$("#win").dialog({
		title: "修改密码",
		width: 300,
		height: 220,
		closed: false,
		cache: false,
		closable: true,
		href: "/User/PwdEdit",
		modal: true
	})
}
function signOut() {
	$.messager.confirm("系统提示", "确定要退出系统吗？", function(a) {
		if (a) {
			$("#hidout").val("1");
			window.location.href = "/admin/login.html"
		}
	})
};
//自适应高度
window.onload = function(){
	$("#leftmenu").height($(window).height() - 70);
	$("#tabs").height($(window).height() - 70);
	$(".panel-body-noborder").height($(window).height() - 111);
	$(".panel-body-noborder").parent().parent().height($(window).height() - 111);
	
	}
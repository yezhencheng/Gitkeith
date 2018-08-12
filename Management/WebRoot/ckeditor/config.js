/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbar = [
	          		{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
	          		{ name: 'editing', items: [ 'Scayt' ] },
	          		{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
	          		{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
	          		{ name: 'tools', items: [ 'Maximize' ] },
	          		{ name: 'document', items: [ 'Source' ] },
	          		'/',
	          		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
	          		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
	          		{ name: 'styles', items: [ 'Styles', 'Format' ] }
	          	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
	
	config.height = 400;
	config.width = 972;
	config.removePlugins = 'elementspath,resize'; // 移除编辑器底部状态栏显示的元素路径和调整编辑器大小的按钮
	config.allowedContent = false; // 是否允许使用源码模式进行编辑
	config.forcePasteAsPlainText = true; // 是否强制复制过来的文字去除格式
	config.filebrowserImageUploadUrl= "message_submit.do";// 图片上传路径
	config.enterMode = CKEDITOR.ENTER_BR; // 编辑器中回车产生的标签CKEDITOR.ENTER_BR(<br>),CKEDITOR.ENTER_P(<p>),CKEDITOR_ENTER(回车)
	config.keystrokes = [[CKEDITOR.CTRL + 86 /* V */, 'paste'] ];// 设置快捷键用于实现Ctrl + V进行粘贴 无此配置，无法进行快捷键粘贴
	config.blockedKeystrokes = [ CKEDITOR.CTRL + 86 ];// 设置快捷键，可能与浏览器冲突plugins/keystrokes/plugin.js此配置将会启动粘贴之前进行过滤，若无此配置，将会出现粘贴之后才弹出过滤框
	config.image_previewText = ' '; // 图片信息面板预览区内容的文字内容，默认显示CKEditor自带的内容
	config.removeDialogTabs = 'image:advanced;image:Link'; // 移除图片上传页面的'高级','链接'页签
	
};

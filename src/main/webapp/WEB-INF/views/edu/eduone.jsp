<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/common/header.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KimParkSeo</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <jsp:include page="/WEB-INF/views/common/common_star.jsp"/>
    <script>
	loginPermission();
    </script>
    <style>
    	.wrap-main .btn{
    		cursor: pointer;
    	}
        .wrap-main,
        .wrap-footer{
            margin: 10px auto;
            width: 1100px;
            height: fit-content;
        }
        .wrap-main>.content{
            overflow: hidden;
        }
        .wrap-main>.content>a{
            float: left;
            width: 50%;
            box-sizing: border-box;
            cursor: pointer;
            text-align: center;
        }
        .wrap-main>.content>.home-menu{
            display: flex;
            float: right;
            align-items: center;
            margin: 10px 0;
        }
        .wrap-main>.content>.home-menu>a>img{
            width: 1em;
            height: 1em;
            background-color: transparent;
            filter: invert(1);
        }
        .wrap-main>.content>hr{
            clear: both;
        }
        .wrap-main>.content>.edu-list {
            clear: both;
        }
        .wrap-main>.content>.edu-list>.edu-detail{
        	padding: 10px 30px;
        }
        .wrap-main>.content>.edu-list>.edu-detail>.edu-detail-content>table{
            line-height: 3em;
            width: 100%;
        }
		.wrap-main>.content>.edu-list>.edu-detail>.edu-detail-content>table>tbody>tr>td>.edu-edit-del{
		    display: flex;
		    float: right;
		    column-gap: 10px;
		    justify-content: flex-end;
		    align-items: center;
		}
        .wrap-main>.content>.edu-list>.edu-detail>.edu-book{
            text-align: center;
            margin-top: 10px;
        }
        .wrap-main .btn{
			background-color: transparent;
			border: 1px solid white;
			cursor: pointer;
			font-size: 16px;
        }
        .wrap-main .btn:hover{
        	background-color: white;
        	color: black;
        	font-weight: bold;
        }
        
        .wrap-main .tabs{
        	display: flex;
        	justify-content: space-around;
        }
        .wrap-main .tabs>div{
        	border: 1px solid white;
        	width: 100%; height: 100%;
        	text-align: center;
        }
        .wrap-main .tabs>div>button{
        	border: 0;
        	background-color: transparent;
        	width: 100%; height: 100%;
        	padding: 15px 0;
        }
        .wrap-main .tabs>div>button:hover{
        	background-color: white;
        	color: black;
        }
        .wrap-main .tabs>div>button:hover>*{
        	background-color: white;
        	color: black;
        	font-weight: bold;
        }
        
        
        /* ckeditor */
        /* Set the minimum height of Classic editor */
        .wrap-main .ck.ck-editor__editable_inline:not(.ck-editor__nested-editable) {
            min-height: 400px;
            width: 100%;
        }
        /* Styles to render an editor with a sidebar for comments & suggestions */
        .wrap-main .container {
            display: flex;
            flex-direction: row;
        }
        .wrap-main .document-outline-container {
            background-color: #f3f7fb;
            width: 200px;
        }
        .wrap-main .sidebar {
            width: 320px;
        }
        .wrap-main #editor-container .ck.ck-editor {
            width: 100%;
        }
        .wrap-main #editor-container .sidebar {
            margin-left: 20px;
        }
        .wrap-main #editor-container .sidebar.narrow {
            width: 30px;
        }
        /* Keep the automatic height of the editor for adding comments */
        .wrap-main .ck-annotation-wrapper .ck.ck-editor__editable_inline {
            min-height: auto;
        }
        /* Styles for viewing revision history */
        .wrap-main #revision-viewer-container {
            display: none;
        }
        .wrap-main #revision-viewer-container .ck.ck-editor {
            width: 860px;
        }
        .wrap-main #revision-viewer-container .ck.ck-content {
            min-height: 400px;
        }
        .wrap-main #revision-viewer-container .sidebar {
            border: 1px #c4c4c4 solid;
            margin-left: -1px;
            width: 320px;
        }
        .wrap-main #revision-viewer-container .ck.ck-revision-history-sidebar__header {
            height: 39px;
            background: #FAFAFA;
        }
        .wrap-main .hidden {
            display: none!important;
        }
        .ck.ckbox-wrapper *{
        	color: black;
        }
        .wrap-main .ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable, .ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners{
        	background-color: transparent;
        	border: 0;
        	color: white;
        }
        
        
        /* grid 부분 */
        .wrap-main .grid.eduOne{
            display: grid;
            grid-template-columns: 1fr 2.5fr 1fr 2.5fr 1fr 2.5fr 1fr 2.5fr;
            grid-row-gap: 10px;
            grid-column-gap: 10px;
            align-items: center;
        }
        .wrap-main .grid.eduOne input
        , .wrap-main .grid.eduOne select{
        	background-color: transparent;
        	border: 1px solid white;
        }
        .wrap-main .grid.eduOne option{
        	color: black;
        }
        .wrap-main .grid.item1:nth-child(1){
            grid-column: 1/9;
            display: grid;
            grid-template-columns: 5fr 1fr;
            border-bottom: 1px solid white;
            padding-bottom: 10px;
            margin-bottom: 10px;
            align-items: center;
        }
        .wrap-main .grid.eduOne input[name=eduSubject]{
        	width: 100%;
        }
        .wrap-main .grid.item1:nth-child(even){
            text-align: center;
        }
        .wrap-main .grid.item1:nth-child(odd)
        , .wrap-main .content .grid.item1:nth-child(4)
        , .wrap-main .content .grid.item1:nth-child(8)
        , .wrap-main .content .grid.item1:nth-child(18){
            text-align: left;
        }
        .wrap-main .grid.item1:nth-child(18){
            border-top: 1px solid white;
            padding-top: 10px;
            margin-top: 10px;
            border-bottom: 1px solid white;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        .wrap-main .grid.item1:last-child{
            border-top: 1px solid white;
            padding-top: 10px;
            margin-top: 10px;
        }
        .wrap-main .grid.item1:nth-child(1) .grid.item2:nth-child(1){
            display: grid;
            grid-template-columns: 1fr 12.1fr;
            align-items: center;
        }
        .wrap-main .grid.item1:nth-child(1) .grid.item2:nth-child(2){
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-column-gap: 10px;
            text-align: center;
        }
        .wrap-main .grid.item1:nth-child(11)
        , .wrap-main .grid.item1:nth-child(15){
            grid-column: 2/5;
        }
        .wrap-main .grid.item1:nth-child(13)
        , .wrap-main .grid.item1:nth-child(17){
            grid-column: 6/9;
        }
        .wrap-main .grid.item1:nth-child(18){
            grid-column: 1/9;
            line-height: 3em;
        }
        .wrap-main .grid.item1:nth-child(19){
            grid-column: 1/9;
        }
        .wrap-main .grid.item1:nth-child(19) .grid.item2{
        	grid-column: 1/9;
        }
        .wrap-main .grid.item1:last-child{
            grid-column: 1/9;
            text-align: center;
        }
        .wrap-footer {
            clear: both;
        }
    </style>
</head>

<body>
	<div class="wrap-header">
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	</div>
    <div class="wrap-main">
        <div class="content">
    		<div class="tabs">
	            <div class="edutab"><button type="button" class="btn edulist"><h3>교육 목록</h3></button></div>
	            <div class="edutab"><button type="button" class="btn edubooklist"><h3>교육 예약 현황</h3></button></div>
    		</div>
            <div class="home-menu">
                <a href="${pageContext.request.contextPath }/home"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
                <div> &nbsp; | 행사 및 교육 | 행사 및 교육신청</div>
            </div>
            <hr>
            <div class="edu-list">
                <div class="edu-detail">
                    <div class="edu-detail-content">
                        <div class="grid eduOne">
                            <div class="grid item1">
                                <div class="grid itmem2">
                                    ${eduOne.eduSubject }
                                </div>
                                <div class="grid item2">
                                    <div class="grid item3">
                                    	<c:if test="${cnt > 0 }">
                                        <button type="submit" class="btn bookdel">취소</button>
                                    	</c:if>
                                    </div>
                                    <c:if test="${ssslogin.mem_admin > 0 }">
                                    <div class="grid item3">
                                        <button type="button" class="btn eduup">수정</button>
                                    </div>
                                    <div class="grid item3">
                                        <button type="submit" class="btn edudel">삭제</button>
                                    </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="grid item1">
                                신청기간
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduBookStart }
                            </div>
                            <div class="grid item1">
                                ~
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduBookEnd }
                            </div>
                            <div class="grid item1">
                                운영기간
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduStart }
                            </div>
                            <div class="grid item1">
                                ~
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduEnd }
                            </div>
                            <div class="grid item1">
                                운영요일
                            </div>
                            <div class="grid item1">
                            <c:choose>
                            	<c:when test="${eduOne.eduDay == 'every' }">매일</c:when>
                            	<c:when test="${eduOne.eduDay == 'mon' }">월요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'tue' }">화요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'wed' }">수요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'thu' }">목요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'fri' }">금요일</c:when>
                            </c:choose>
                            </div>
                            <div class="grid item1">
                                교육장소
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduAddress }
                            </div>
                            <div class="grid item1">
                                교육대상
                            </div>
                            <div class="grid item1">
                                <c:choose>
                                	<c:when test="${eduOne.eduParticipant == 'all' }">모두</c:when>
                                	<c:when test="${eduOne.eduParticipant == 'element' }">초등학생</c:when>
                                	<c:when test="${eduOne.eduParticipant == 'middle' }">중학생</c:when>
                                	<c:when test="${eduOne.eduParticipant == 'middle' }">고등학생</c:when>
                                </c:choose>
                            </div>
                            <div class="grid item1">
                                인원
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduBookNum }/${eduOne.eduMaxNum }
                            </div>
                            <div class="grid item1 eduContent">
                            	<div id="editor-container">
								    <div class="container">
								        <!-- 
								         -->
								        <div id="outline" class="document-outline-container" style="display: none;"></div>
								        <textarea name="eduContent" id="editor"></textarea>
								    </div>
								</div>
                            </div>
                            <div class="grid item1">
                                <button type="button" class="btn book">신청하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrap-footer">
            <footer>
                <%@include file="/WEB-INF/views/common/footer.jsp" %>
            </footer>
        </div>
    </div>
<script src="https://cdn.ckbox.io/CKBox/2.4.0/ckbox.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/translations/ko.js"></script>
<script>
    const ckInstance = CKEDITOR.ClassicEditor
    .create( document.querySelector( '#editor' ), {
        // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
        toolbar: {
            items: [
                'aiCommands', 'aiAssistant', '|',
                'ckbox', 'uploadImage', '|',
                'exportPDF','exportWord', '|',
                'comment', 'trackChanges', 'revisionHistory', '|',
                'findAndReplace', 'selectAll', 'formatPainter', '|',
                'undo', 'redo',
                '-',
                'bold', 'italic', 'strikethrough', 'underline', 'removeFormat', '|',
                'bulletedList', 'numberedList', 'todoList', '|',
                'outdent', 'indent', '|',
                'alignment', '|',
                '-',
                'heading', '|',
                'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                'link', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', 'tableOfContents', 'insertTemplate', '|',
                'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                // Intentionally skipped buttons to keep the toolbar smaller, feel free to enable them:
                // 'code', 'subscript', 'superscript', 'textPartLanguage', '|',
                // ** To use source editing remember to disable real-time collaboration plugins **
                // 'sourceEditing'
            ],
            shouldNotGroupWhenFull: true
        },
        // Changing the language of the interface requires loading the language file using the <script> tag.
        // language: 'es',
        list: {
            properties: {
                styles: true,
                startIndex: true,
                reversed: true
            }
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
        heading: {
            options: [
                { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
            ]
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
        fontFamily: {
            options: [
                'default',
                'Arial, Helvetica, sans-serif',
                'Courier New, Courier, monospace',
                'Georgia, serif',
                'Lucida Sans Unicode, Lucida Grande, sans-serif',
                'Tahoma, Geneva, sans-serif',
                'Times New Roman, Times, serif',
                'Trebuchet MS, Helvetica, sans-serif',
                'Verdana, Geneva, sans-serif'
            ],
            supportAllValues: true
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
        fontSize: {
            options: [ 10, 12, 14, 'default', 18, 20, 22 ],
            supportAllValues: true
        },
        // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
        // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
        // htmlSupport: {
        // 	allow: [
        // 		{
        // 			name: /.*/,
        // 			attributes: true,
        // 			classes: true,
        // 			styles: true
        // 		}
        // 	]
        // },
        // Be careful with enabling previews
        // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
        htmlEmbed: {
            showPreviews: true
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
        mention: {
            feeds: [
                {
                    marker: '@',
                    feed: [
                        '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                        '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                        '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                        '@sugar', '@sweet', '@topping', '@wafer'
                    ],
                    minimumCharacters: 1
                }
            ]
        },
        template: {
            definitions: [
                {
                    title: 'The title of the template',
                    description: 'A longer description of the template',
                    data: '<p>Data inserted into the content</p>'
                },
                {
                    title: 'Annual financial report',
                    description: 'A report that spells out the company\'s financial condition.',
                    data: `<figure class="table">
						<table style="border:2px solid hsl(0, 0%, 0%);">
							<thead>
								<tr>
									<th style="text-align:center;" rowspan="2">Metric name</th>
									<th style="text-align:center;" colspan="4">Year</th>
								</tr>
								<tr>
									<th style="background-color:hsl(90, 75%, 60%);text-align:center;">2019</th>
									<th style="background-color:hsl(90, 75%, 60%);text-align:center;">2020</th>
									<th style="background-color:hsl(90, 75%, 60%);text-align:center;">2021</th>
									<th style="background-color:hsl(90, 75%, 60%);text-align:center;">2022</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><strong>Revenue</strong></th>
									<td>$100,000.00</td>
									<td>$120,000.00</td>
									<td>$130,000.00</td>
									<td>$180,000.00</td>
								</tr>
								<tr>
									<th style="background-color:hsl(0, 0%, 90%);"><strong>Operating expenses</strong></th>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th><strong>Interest</strong></th>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th style="background-color:hsl(0, 0%, 90%);"><strong>Net profit</strong></th>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</figure>`
                },
            ]
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
        placeholder: '교육 세부 내용을 입력해주세요.',
        // Used by real-time collaboration
        cloudServices: {
            // Be careful - do not use the development token endpoint on production systems!
            tokenUrl: 'https://108971.cke-cs.com/token/dev/LWvcqjSdY8J1orf2B1bT0an5x6qP8mxfseAP?limit=10',
            webSocketUrl: 'wss://108971.cke-cs.com/ws',
            uploadUrl: '${pageContext.request.contextPath}/fileupload.ajax'
        },
        collaboration: {
            // Modify the channelId to simulate editing different documents
            // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/real-time-collaboration/real-time-collaboration-integration.html#the-channelid-configuration-property
            channelId: 'document-id-7'
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-custom-configuration.html#sidebar-configuration
        /* 
        sidebar: {
            container: document.querySelector( '#sidebar' )
        },
         */
        documentOutline: {
            container: document.querySelector( '#outline')
        },
        // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/real-time-collaboration/users-in-real-time-collaboration.html#users-presence-list
        /* presenceList: {
            container: document.querySelector( '#presence-list-container' )
        }, */
        // Add configuration for the comments editor if the Comments plugin is added.
        // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-custom-configuration.html#comment-editor-configuration
        comments: {
            editorConfig: {
                extraPlugins: CKEDITOR.ClassicEditor.builtinPlugins.filter( plugin => {
                    // Use e.g. Ctrl+B in the comments editor to bold text.
                    return [ 'Bold', 'Italic', 'Underline', 'List', 'Autoformat', 'Mention' ].includes( plugin.pluginName );
                } ),
                // Combine mentions + Webhooks to notify users about new comments
                // https://ckeditor.com/docs/cs/latest/guides/webhooks/events.html
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@Baby Doe', '@Joe Doe', '@Jane Doe', '@Jane Roe', '@Richard Roe'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
            }
        },
        // Do not include revision history configuration if you do not want to integrate it.
        // Remember to remove the 'revisionHistory' button from the toolbar in such a case.
        /* revisionHistory: {
            editorContainer: document.querySelector( '#editor-container' ),
            viewerContainer: document.querySelector( '#revision-viewer-container' ),
            viewerEditorElement: document.querySelector( '#revision-viewer-editor' ),
            viewerSidebarContainer: document.querySelector( '#revision-viewer-sidebar' ),
        }, */
        // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/ckbox.html
        ckbox: {
            // Be careful - do not use the development token endpoint on production systems!
            tokenUrl: 'https://108971.cke-cs.com/token/dev/480089465bf9c72a98d5caf3add530c0df7042cea25ad2bc740dac8fd8d3?limit=10'
        },
        ai: {
            // AI Assistant feature configuration.
            // https://ckeditor.com/docs/ckeditor5/latest/features/ai-assistant.html
            aiAssistant: {
                contentAreaCssClass: "formatted"
            },
            // Configure one of the supported AI integration: OpenAI, Azure OpenAI, Amazon Bedrock
            // https://ckeditor.com/docs/ckeditor5/latest/features/ai-assistant/ai-assistant-integration.html#integration
            openAI: {
                // apiUrl: 'https://url.to.your.application/ai'
            }
        },
        style: {
            definitions: [
                {
                    name: 'Article category',
                    element: 'h3',
                    classes: [ 'category' ]
                },
                {
                    name: 'Info box',
                    element: 'p',
                    classes: [ 'info-box' ]
                },
            ]
        },
        // License key is required only by the Pagination plugin and non-realtime Comments/Track changes.
        licenseKey: 'NGN3bHZtUjJWZjk4Zis1N0xmUGhqQ2Q5RjFWVU1MZVNGM1h6L1FBRnVpNE0xV0I5THdTTkptOFpqaUtKLU1qQXlOREExTWpZPQ==',
        removePlugins: [
            // Before enabling Pagination plugin, make sure to provide proper configuration and add relevant buttons to the toolbar
            // https://ckeditor.com/docs/ckeditor5/latest/features/pagination/pagination.html
            'Pagination',
            // Intentionally disabled, file uploads are handled by CKBox
            'Base64UploadAdapter',
            // Intentionally disabled, file uploads are handled by CKBox
            'CKFinder',
            // Intentionally disabled, file uploads are handled by CKBox
            'EasyImage',
            // Requires additional license key
            'WProofreader',
            // Incompatible with real-time collaboration
            'SourceEditing',
            // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
            // from a local file system (file://) - load this site via HTTP server if you enable MathType
            'MathType',
            // If you would like to adjust enabled collaboration features:
            'RealTimeCollaborativeComments',
            'RealTimeCollaborativeTrackChanges',
            'RealTimeCollaborativeRevisionHistory',
            'PresenceList',
            'sidebar', 
            // 'Comments',
            // 'TrackChanges',
            // 'TrackChangesData',
            'RevisionHistory'
        ]
    } )
        .then( b => {
            a = b;
            // readonly 모드
            a.enableReadOnlyMode( 'feature-id' );
            // readonly 모드 시 툴바 제거
            const toolbarElement = a.ui.view.toolbar.element;
			toolbarElement.style.display = 'none';
			var content = '${eduOne.eduContent}';
            a.setData(content);
            // Example implementation to switch between different types of annotations according to the window size.
            // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-display-mode.html
            const annotationsUIs = a.plugins.get( 'AnnotationsUIs' );
            /* 
            const sidebarElement = document.querySelector( '.sidebar' );
             */
            let currentWidth;

            function refreshDisplayMode() {
                // Check the window width to avoid the UI switching when the mobile keyboard shows up.
                if ( window.innerWidth === currentWidth ) {
                    return;
                }
                currentWidth = window.innerWidth;

                if ( currentWidth < 1000 ) {
                    /* 
                	sidebarElement.classList.remove( 'narrow' );
                    sidebarElement.classList.add( 'hidden' );
                     */
                    annotationsUIs.switchTo( 'inline' );
                }
                else if ( currentWidth < 1300 ) {
                    /* 
                	sidebarElement.classList.remove( 'hidden' );
                    sidebarElement.classList.add( 'narrow' );
                     */
                    annotationsUIs.switchTo( 'narrowSidebar' );
                }
                else {
                    /* 
                	sidebarElement.classList.remove( 'hidden', 'narrow' );
                     */
                	annotationsUIs.switchTo( 'wideSidebar' );
                }
            }
			/* 
            a.ui.view.listenTo( window, 'resize', refreshDisplayMode );
            refreshDisplayMode();
			 */
            return a;
        } )
        .catch( error => {
            console.error( 'There was a problem initializing the editor.', error );
        } );
</script>
<script>
$(loadedHandler);
function loadedHandler(){
	$(".btn.book").on("click", bookClkHandler);
	$(".btn.bookdel").on("click", bookDelHandler);
	$(".btn.eduup").on("click", eduUpHandler);
	$(".btn.edudel").on("click", eduDelHandler);
	$(".btn.edulist").on("click", eduListHandler);
	$(".btn.edubooklist").on("click", eduBookListHandler);
}
//교육 목록 페이지 이동
function eduListHandler(){
	location.href = "${pageContext.request.contextPath}/edu";
}
// 교육 신청 현황 페이지 이동
function eduBookListHandler(){
	location.href = "${pageContext.request.contextPath}/edu/book";
}
// 교육 수정하기
function eduUpHandler(){
	location.href = "${pageContext.request.contextPath}/edu/list/update?id=${eduOne.eduId}";
}
// 교육 신청하러 가기
function bookClkHandler(){
	location.href = "${pageContext.request.contextPath}/edu/form?id=${eduOne.eduId}";
}
// 교육 신청 취소
function bookDelHandler(){
	var eduIdVal = $("#eduId").val();
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/book/delete.ajax"
		, method : "post"
		, data : {eduId : eduIdVal}
		, error : ajaxErrorHandler
		, success : function(result){
			if(result == 1){
				alert("교육 신청 취소가 완료되었습니다.");
				location.reload();
			}else{
				alert("교육 신청 취소 중 오류가 발생했습니다.");
			}
		}
	});
}
// 교육 삭제
function eduDelHandler(){
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/delete.ajax"
		, method : "post"
		, data : "${eduOne.eduId}"
		, error : ajaxErrorHandler
		, success : function(result){
			if(result == 1){
				alert("교육이 삭제되었습니다.");
				location.href = "${pageContext.request.contextPath}/edu";
			}else{
				alert("교육 삭제 중 오류가 발생했습니다.");
			}
		}
	});
}
(function border(){
	$("tr:first-of-type").css("border-bottom", "1px solid white");
	$("#content").css("border-top", "1px solid white");
	$("#content").css("border-bottom", "1px solid white");
	$("tr:last-of-type").css("border-bottom", "1px solid white");
})();
</script>
</body>
</html>
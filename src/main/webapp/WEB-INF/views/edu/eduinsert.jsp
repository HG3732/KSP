<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/common/header.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KimParkSeo</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <jsp:include page="/WEB-INF/views/common/common_star.jsp"/>
    <script>
	adminPermission();
    </script>
    <style>
    	.wrap-main .btn{
    		cursor: pointer;
    		background-color: transparent;
    		border: 1px solid white;
    	}
    	.wrap-main .btn:hover{
    		background-color: white;
    		color: black;
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
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-ins{
            text-align: center;
        }
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-ins>button{
            margin-top: 10px;
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
            border-bottom: 1px solid white;
            padding-bottom: 10px;
            margin-bottom: 10px;
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
        }
        .wrap-main .grid.item1.file{
            grid-column: 1/9;
            display: grid;
            grid-row-gap: 10px;
        }
        .wrap-main .grid.item1:last-child{
            grid-column: 1/9;
            text-align: center;
        }
        .wrap-main .ui-datepicker-trigger{
        	display: none;
        }
        .wrap-main input[name=eduAddress]{
        	width: 100%;
        }
        .wrap-main .grid.item1.eduContent *{
        	color: black;
        }
        
        .wrap-main .btn.file{
        	margin-left: 10px;
        }
		.wrap-main #frm-eduins > div > div > div.grid.item1.file > div > input{
			border: 0;
		}        
        
        
        #ui-datepicker-div > div > div *
        , #ui-datepicker-div > div > div{
        	color: black;
        }
        
        


        .wrap-footer {
            clear: both;
        }
    </style>
    <script>
	$(loadedHandler);
	function loadedHandler(){
		$(".btn.eduins").on("click", eduInsertHandler);
		$(".btn.file").on("click", eduFileHandler);
		$(".btn.edulist").on("click", eduListHandler);
		$(".btn.edubooklist").on("click", eduBookListHandler);
	}
    </script>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
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
					<form id="frm-eduins">
	                    <div class="edu-detail-content">
	                		<input type="hidden" name="eduId" value="${detail.eduId }" >
	                        <div class="grid eduOne">
	                            <div class="grid item1">
	                                <div class="grid item2">
	                                	<div class="grid item3">
		                                	교육제목
	                                	</div>
	                                	<div class="grid item3">
	                                    	<input type="text" name="eduSubject" required autocomplete="off">
	                                	</div>
	                                </div>
	                                <div class="grid item2" style="display: none;">
	                                    <div class="grid item3">
	                                        <button type="submit" class="btn bookdel">취소</button>
	                                    </div>
	                                    <div class="grid item3">
	                                        <button type="button" class="btn eduup">수정</button>
	                                    </div>
	                                    <div class="grid item3">
	                                        <button type="submit" class="btn edudel">삭제</button>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="grid item1">
	                                신청기간
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduBookStart" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                ~
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduBookEnd" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                운영기간
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduStart" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                ~
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduEnd" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                운영요일
	                            </div>
	                            <div class="grid item1">
	                            	<select name="eduDay">
	                            		<option value="every">매일</option>
	                            		<option value="mon">월요일</option>
	                            		<option value="tue">화요일</option>
	                            		<option value="wed">수요일</option>
	                            		<option value="thu">목요일</option>
	                            		<option value="fri">금요일</option>
	                            	</select>
	                            </div>
	                            <div class="grid item1">
	                                교육장소
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduAddress" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                교육대상
	                            </div>
	                            <div class="grid item1">
	                            	<select name="eduParticipant">
	                            		<option value="all">모두</option>
	                            		<option value="element">초등학생</option>
	                            		<option value="middle">중학생</option>
	                            		<option value="high">고등학생</option>
	                            		<option value="adult">성인</option>
	                            	</select>
	                            </div>
	                            <div class="grid item1">
	                                정원
	                            </div>
	                            <div class="grid item1">
	                                <input type="number" name="eduMaxNum" min=1 required autocomplete="off">
	                            </div>
	                            <div class="grid item1 eduContent">
                                    <div id="editor-container">
									    <div class="container">
									        <div id="outline" class="document-outline-container" style="display: none;"></div>
									        <textarea name="eduContent" id="editor"></textarea>
									    </div>
									</div>
	                            </div>
	                            <div class="grid item1 file">
	                            	<div class="grid item2">
	                                	첨부파일(최대 10MB)
	                                	<button type="button" class="btn file">추가</button>
	                                	<!-- 
	                                	<button id="upload_widget" class="btn cloudinary">추가</button>
	                                	 -->
	                            	</div>
	                            </div>
	                            <div class="grid item1">
	                                <button type="button" class="btn eduins">등록하기</button>
	                            </div>
	                        </div>
	                    </div>
					</form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- ckeditor -->
	<script src="https://cdn.ckbox.io/CKBox/2.4.0/ckbox.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/translations/ko.js"></script>
	<script>
	    const ckInstance = CKEDITOR.ClassicEditor
	    .create( document.querySelector( '#editor' ), {
	    	language: {ui: 'ko', content: 'ko'}, 
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
	                // 'bulletedList', 'numberedList', 'todoList', '|',
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
				tokenUrl: 'https://110380.cke-cs.com/token/dev/ALTCWJbpBbcPjffRdzRes4WagIzLqxcv7h9J?limit=10',
				webSocketUrl: 'wss://110380.cke-cs.com/ws',
				//uploadUrl: 'https://110380.cke-cs.com/easyimage/upload/'
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
	            container: document.querySelector( '#outline'),
	            showEmptyHeadings: true
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
	        licenseKey: 'NHBPRmY2NVd2Zld4dUpFK2Y5VkNSakYzdHBHZWg1bVRuUTJYc0s2U09iY2MxL1RmMjlvY3psWnNzTmJLSVE9PS1NakF5TkRBM01qWT0=',
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
	            'documentOutline', 
	            // 'Comments',
	            // 'TrackChanges',
	            // 'TrackChangesData',
	            'RevisionHistory'
	        ]
	    } )
	        .then( b => {
	            a = b;
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
	//교육 목록 페이지 이동
	function eduListHandler(){
		location.href = "${pageContext.request.contextPath}/edu";
	}
	// 교육 신청 현황 페이지 이동
	function eduBookListHandler(){
		location.href = "${pageContext.request.contextPath}/edu/book";
	}
	// 파일 추가
	function eduFileHandler(){
		var htmlVal = `
		<div class="grid item2 file">
			<input type="file" name="uploadfiles" class="uploadfiles" required><button type="button" class="btn fileCancel">취소</button>
		</div>
		`;
		$(this).parent().parent().append(htmlVal);
		$(".btn.fileCancel").off("click");
		$(".btn.fileCancel").on("click", eduFileCancelHandler);
	}
	// 파일 취소
	function eduFileCancelHandler(){
		$(this).parent().remove();
	}
	// 교육 등록하기
	function eduInsertHandler(){
		console.log("==========");
		console.log($("#frm-eduins").serialize());
		$("[name=eduContent]").val(a.getData());
		console.log($("#frm-eduins").serialize());	
		var formData = new FormData($("#frm-eduins")[0]);
		//var eduContent = new FormData($("#container")[0]);
		//var eduContentVal = eduContent.html();
		if(confirm("교육을 등록하시겠습니까?")){
			$.ajax({
				url : "${pageContext.request.contextPath}/edu/list/insert"
				, method : "post"
				// , enctype : "multipart/form-data"
				//, data : {formData : formData, eduContent : eduContentVal}
				, data : formData
				, contentType : false
				, processData : false
				, error : ajaxErrorHandler
				, success : function(result){
					if(result == 1){
						alert("교육 등록이 완료되었습니다.");
						console.error(result);
						location.href = "${pageContext.request.contextPath}/edu";
					}else{
						alert("교육 등록 중 오류가 발생했습니다.\n관리자에게 문의해주시기 바랍니다.");
					}
				}
			});
		}
	}
	// datePicker
	$(function() {
	    //input을 datepicker로 선언
	    $(".datePicker").datepicker({
	        dateFormat: 'yy-mm-dd' //달력 날짜 형태
	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	        ,changeYear: false //option값 년 선택 가능
	        ,changeMonth: false //option값  월 선택 가능                
	        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	        ,buttonImageOnly: false //버튼 이미지만 깔끔하게 보이게함
	        ,buttonText: "선택" //버튼 호버 텍스트              
	        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	    });                    
	    
	    //초기값을 오늘 날짜로 설정해줘야 합니다.
	    //$('.datePicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
	</script>
</body>

</html>
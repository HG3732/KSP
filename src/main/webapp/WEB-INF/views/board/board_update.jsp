<link href="${pageContext.request.contextPath}/resource/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_update.css"
	rel="stylesheet">
<link
href="${pageContext.request.contextPath}/resource/css/board/board_ck.css"
rel="stylesheet">	
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board Write</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https:/code.jquery.com/jquery-3.7.1.js"></script>
<jsp:include page="/WEB-INF/views/common/common_star.jsp" />
</head>
<style>
.container-ck {
    color: black;
}
#editor-container > div > div.ck.ck-reset.ck-editor.ck-rounded-corners > div.ck.ck-editor__main > div{
	background: transparent;
}
</style>

<body>
	<div class="wrap-header">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>
	<div class="wrap-main">
		<div class="container">
			<div class="flexnav">
				<a href="${pageContext.request.contextPath}/board/community"
					class="flex community">게시판</a> <a
					href="${pageContext.request.contextPath}/board/faq"
					class="flex faq">FAQ</a>
			</div>
			<div class="location">
				<div class="location notice">
					<span>게시판</span>
				</div>
				<div class="location community">
					<span>커뮤니티 > </span>
				</div>
				<div class="location main">
					<span>메인이미지 > </span>
				</div>
			</div>
			<div class="subject">
				<div>게시판</div>
			</div>
			<div class="contents">
				<div class="board-write">
					<form id="frm-write">
					<input type="hidden" name="boardNo" value="${detail.boardNo}">
						<div class="insert-form">
							<table>
								<tr>
									<th>작성자</th>
									<td>${ssslogin.mem_id }</td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input type="text" name="title" id="write-title"
										title="제목 입력" value="${detail.boardTitle}"></td>
								</tr>
								<tr>
									<th>내용</th>

									<td>
										<div id="editor-container">
                                            <div class="container-ck">
                                                <div id="outline" class="document-outline-container" style="display:none;"></div>
                                                <textarea id="editor" name="content">${detail.boardContent}</textarea>
                                            </div>
                                        </div>
									</td>
									
								</tr>
								<tr>
									<th>첨부파일</th>
									<td>
										<ul>
											<li><input type="file" name="uploadfiles" id="file_1"></li>
											<li><input type="file" name="uploadfiles" id="file_2"></li>
											<li><input type="file" name="uploadfiles" id="file_3"></li>
										</ul>
									</td>
								</tr>
							</table>
						</div>
						<div class="write-btn">
							<button type="button" id="btn-submit">수정하기</button>
							<button type="button" id="btn-list">목록</button>
						</div>
						<!-- 모달 -->
						<div class="modal update">
							<div class="modal_body">
								<h2>글을 수정하시겠습니까?</h2>
								<div class="modal-btn">
									<button type="button" id="btn-update-modalok">확인</button>
									<button type="button" id="btn-update-modalcancel">취소</button>
								</div>
							</div>
						</div>
						<!-- 모달 목록 -->
						<div class="modal list">
							<div class="modal_body">
								<h2>글 작성을 취소하시겠습니까?</h2>
								<div class="modal-btn">
									<button type="button" id="btn-list-modalok">확인</button>
									<button type="button" id="btn-list-modalcancel">취소</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<div class="wrap-footer">
		<footer> 
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
		</footer>
	</div>
	</div>

	<script>
	// 로그인상태 확인
	(function() {
		loginPermission();
	})();
	//
		$(loadedHandler);
		function loadedHandler() {
			/* $("#btn-list-modalok").on("click", loginPermission); */
			$("#btn-submit").on("click", btnUpModalClickHandler);
			$("#btn-update-modalok").on("click", btnUpModalOkClickHandler);
			$("#btn-update-modalcancel").on("click",
					btnUpModalCancleClickHandler);

			$("#btn-list").on("click", btnListModalClickHandler);
			$("#btn-list-modalok").on("click", btnListModalOkClickHandler);
			$("#btn-list-modalcancel").on("click",
					btnListModalCancleClickHandler);
		}

		function btnUpModalClickHandler() {
			console.log("모달창 오픈");
			if ($("[name=title]").val().trim().lenght == 0
					|| $("[name=content]").val().trim().length == 0) {
				alert("공백란 없이 입력해주세요.");
			} else {
				$(".modal.update").css("display", "block");
			}

		}
		function btnUpModalOkClickHandler() {
			console.log("눌림");
			var frm = document.getElementById("frm-write");
			frm.method = "post";
			// frm.enctype = "multipart/form-data"; // form 태그 내부에 input type="file"이 있다면
			frm.action = "${pageContext.request.contextPath}/board/update"; 
			frm.submit();

		}
		function btnUpModalCancleClickHandler() {
			console.log("모달창 닫기");
			$(".modal.update").css("display", "none");
		}

		// 목록 모달
		function btnListModalClickHandler() {
			console.log("모달창 오픈");
			$(".modal.list").css("display", "block");
		}
		function btnListModalOkClickHandler() {
			console.log("눌림");
			location.href = "${pageContext.request.contextPath}/board/community";
		}
		function btnListModalCancleClickHandler() {
			console.log("모달창 닫기");
			$(".modal.list").css("display", "none");
		}
		
		// 클라우디너리
		</script>
	    <script src="https://cdn.ckbox.io/CKBox/2.4.0/ckbox.js"></script>
	    <script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/ckeditor.js"></script>
		<script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/translations/es.js"></script>
	    <script>
	    
		// ck 에디터
	        // This sample still does not showcase all CKEditor 5 features (!)
	        // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
	        CKEDITOR.ClassicEditor.create(document.querySelector('#editor'), { // 여기 editor
	            // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
	            toolbar: {
	                items: [
	                    'aiCommands', 'aiAssistant', '|',
	                    'ckbox', 'uploadImage', '|',
	                    'exportPDF', 'exportWord', '|',
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
	                options: [10, 12, 14, 'default', 18, 20, 22],
	                supportAllValues: true
	            },
	            // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
	            // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
	            // htmlSupport: {
	            //  allow: [
	            //      {
	            //          name: /.*/,
	            //          attributes: true,
	            //          classes: true,
	            //          styles: true
	            //      }
	            //  ]
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
	            placeholder: '내용을 입력해주세요.',
	            // Used by real-time collaboration
	            cloudServices: {
	                // Be careful - do not use the development token endpoint on production systems!
	                tokenUrl: 'https://108971.cke-cs.com/token/dev/LWvcqjSdY8J1orf2B1bT0an5x6qP8mxfseAP?limit=10',
	                webSocketUrl: 'wss://108971.cke-cs.com/ws',
	                uploadUrl: 'https://108971.cke-cs.com/easyimage/upload/'
	            },
	            collaboration: {
	                // Modify the channelId to simulate editing different documents
	                // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/real-time-collaboration/real-time-collaboration-integration.html#the-channelid-configuration-property
	                channelId: 'document-id-7'
	            },
	            // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-custom-configuration.html#sidebar-configuration
	            /* sidebar: {
	                container: document.querySelector('#sidebar')
	            }, */
	            documentOutline: {
	                container: document.querySelector('#outline')
	            },
	            // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/real-time-collaboration/users-in-real-time-collaboration.html#users-presence-list
	            /* presenceList: {
	                container: document.querySelector('#presence-list-container')
	            }, */
	            // Add configuration for the comments editor if the Comments plugin is added.
	            // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-custom-configuration.html#comment-editor-configuration
	            comments: {
	                editorConfig: {
	                    extraPlugins: CKEDITOR.ClassicEditor.builtinPlugins.filter(plugin => {
	                        // Use e.g. Ctrl+B in the comments editor to bold text.
	                        return ['Bold', 'Italic', 'Underline', 'List', 'Autoformat', 'Mention'].includes(plugin.pluginName);
	                    }),
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
	                editorContainer: document.querySelector('#editor-container'),
	                viewerContainer: document.querySelector('#revision-viewer-container'),
	                viewerEditorElement: document.querySelector('#revision-viewer-editor'),
	                viewerSidebarContainer: document.querySelector('#revision-viewer-sidebar'),
	            }, */
	            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/ckbox.html
	            ckbox: {
	                // Be careful - do not use the development token endpoint on production systems!
	                tokenUrl: 'https://108971.cke-cs.com/token/dev/LWvcqjSdY8J1orf2B1bT0an5x6qP8mxfseAP?limit=10'
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
	                        classes: ['category']
	                    },
	                    {
	                        name: 'Info box',
	                        element: 'p',
	                        classes: ['info-box']
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
	                // 'Comments',
	                // 'TrackChanges',
	                // 'TrackChangesData',
	                'RevisionHistory'
	            ]
	        })
	            .then(a => {
	                b = a;

	                // Example implementation to switch between different types of annotations according to the window size.
	                // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-display-mode.html
	                const annotationsUIs = b.plugins.get('AnnotationsUIs');
	                // const sidebarElement = document.querySelector('.sidebar');
	                let currentWidth;

	                function refreshDisplayMode() {
	                    // Check the window width to avoid the UI switching when the mobile keyboard shows up.
	                    if (window.innerWidth === currentWidth) {
	                        return;
	                    }
	                    currentWidth = window.innerWidth;

	                    if (currentWidth < 1000) {
	                        // sidebarElement.classList.remove('narrow');
	                        // sidebarElement.classList.add('hidden');
	                        annotationsUIs.switchTo('inline');
	                    }
	                    else if (currentWidth < 1300) {
	                        // sidebarElement.classList.remove('hidden');
	                        // sidebarElement.classList.add('narrow');
	                        annotationsUIs.switchTo('narrowSidebar');
	                    }
	                    else {
	                        // sidebarElement.classList.remove('hidden', 'narrow');
	                        annotationsUIs.switchTo('wideSidebar');
	                    }
	                }

	                // editor.ui.view.listenTo(window, 'resize', refreshDisplayMode);
	                // refreshDisplayMode();

	                return b;
	            })
	            .catch(error => {
	                // console.error('There was a problem initializing the editor.', error);
	            });
	    </script>

</body>

</html>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Monte sua Pizza - ComerPizza.com.br</title>

		<meta name="description" content="and Validation" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<link rel="stylesheet" href="assets/css/select2.css" />

		<!--fonts-->

		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!--ace styles-->

		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-header widget-header-blue widget-header-flat">
						<h4 class="lighter">ComerPizza</h4>

						<div class="widget-toolbar">
						</div>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<div class="row-fluid">
								<div id="fuelux-wizard" class="row-fluid hide" data-target="#step-container">
									<ul class="wizard-steps">
										<li data-target="#step1" class="active">
											<span class="step">1</span>
											<span class="title">Pizza</span>
										</li>

										<li data-target="#step2">
											<span class="step">2</span>
											<span class="title">Bebidas</span>
										</li>

										<li data-target="#step3">
											<span class="step">3</span>
											<span class="title">Pagamento</span>
										</li>
									</ul>
								</div>

								<hr />
								<div class="step-content row-fluid position-relative" id="step-container">
									<div class="step-pane active" id="step1">
										<h3 class="lighter block green">Faça sua pizza</h3>

										<form class="form-horizontal" id="sample-form" />
											<div class="row-fluid">
												<div class="span12">
													<div class="tabbable">
														<ul class="nav nav-tabs" id="myTab">
															<li class="active">
																<a data-toggle="tab" href="#size">
																	Tamanho
																</a>
															</li>
															<li class="">
																<a data-toggle="tab" href="#flavor">
																	Sabor
																</a>
															</li>
															<li class="">
																<a data-toggle="tab" href="#border">
																	Borda Recheada
																</a>
															</li>
														</ul>
														<div class="tab-content">
															<div id="size" class="tab-pane active">
																<div class="span6">
																	<div class="control-group">
																		<label class="control-label">Escolha um Tamanho</label>
																		<div class="controls">
																			<label>
																				<input name="size-radio" type="radio">
																				<span class="lbl"> Pequena</span>
																			</label>

																			<label>
																				<input name="size-radio" type="radio">
																				<span class="lbl"> Média</span>
																			</label>

																			<label>
																				<input name="size-radio" type="radio">
																				<span class="lbl"> Grande</span>
																			</label>

																			<label>
																				<input disabled="" name="size-radio" type="radio">
																				<span class="lbl"> Gigante </span>
																			</label>
																		</div>																	</div>
																</div>
															</div>

															<div id="flavor" class="tab-pane">
																<div class="span6">
																	<div class="control-group">
																		<label class="control-label">Escolha o Sabor</label>
																		<div class="controls">
																			<label>
																				<input name="flavor-radio" type="radio">
																				<span class="lbl"> Calabresa </span>
																			</label>

																			<label>
																				<input name="flavor-radio" type="radio">
																				<span class="lbl"> Mussarela </span>
																			</label>

																			<label>
																				<input name="flavor-radio" class="ace-checkbox-2" type="radio">
																				<span class="lbl"> Portuguesa </span>
																			</label>

																			<label>
																				<input name="flavor-radio" disabled="" type="radio">
																				<span class="lbl"> Frango com Catupery </span>
																			</label>
																		</div>
																	</div>
																</div>
															</div>

															<div id="border" class="tab-pane">
																<div class="span6">
																	<div class="control-group">
																		<label class="control-label">Tipo de Borda</label>

																		<div class="controls">
																			<label>
																				<input name="border-type" type="radio">
																				<span class="lbl"> Sem recheio </span>
																			</label>
																			<label>
																				<input name="border-type" type="radio">
																				<span class="lbl"> Cheddar </span>
																			</label>
																			<label>
																				<input name="border-type" type="radio">
																				<span class="lbl"> Cheddar </span>
																			</label>
																		</div>
																	</div>
																</div>
															</div>
														</div>

													</div>
												</div><!--/span-->

												<div class="vspace-6"></div>

											</div>
										</form>
									</div>
								</div>
								<hr />
								<div class="row-fluid wizard-actions">
									<button class="btn btn-prev" disabled="disabled">
										<i class="icon-arrow-left"></i>
										Prev
									</button>

									<button class="btn btn-success btn-next" data-last="Finish ">
										Next
										<i class="icon-arrow-right icon-on-right"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--basic scripts-->

		<!--[if !IE]>-->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		<!--<![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<script src="assets/js/fuelux/fuelux.wizard.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/additional-methods.min.js"></script>
		<script src="assets/js/bootbox.min.js"></script>
		<script src="assets/js/jquery.maskedinput.min.js"></script>
		<script src="assets/js/select2.min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
			
				$('[data-rel=tooltip]').tooltip();
			
				$(".select2").css('width','150px').select2({allowClear:true})
				.on('change', function(){
					$(this).closest('form').validate().element($(this));
				}); 
			
			
				var $validation = false;
				$('#fuelux-wizard').ace_wizard().on('change' , function(e, info){
					if(info.step == 1 && $validation) {
						if(!$('#validation-form').valid()) return false;
					}
				}).on('finished', function(e) {
					bootbox.dialog("Thank you! Your information was successfully saved!", [{
						"label" : "OK",
						"class" : "btn-small btn-primary",
						}]
					);
				}).on('stepclick', function(e){
					//return false;//prevent clicking on steps
				});
			
			
				$('#validation-form').hide();
				$('#skip-validation').removeAttr('checked').on('click', function(){
					$validation = this.checked;
					if(this.checked) {
						$('#sample-form').hide();
						$('#validation-form').show();
					}
					else {
						$('#validation-form').hide();
						$('#sample-form').show();
					}
				});
			
			
			
				//documentation : http://docs.jquery.com/Plugins/Validation/validate
			
			
				$.mask.definitions['~']='[+-]';
				$('#phone').mask('(999) 999-9999');
			
				jQuery.validator.addMethod("phone", function (value, element) {
					return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
				}, "Enter a valid phone number.");
			
				$('#validation-form').validate({
					errorElement: 'span',
					errorClass: 'help-inline',
					focusInvalid: false,
					rules: {
						email: {
							required: true,
							email:true
						},
						password: {
							required: true,
							minlength: 5
						},
						password2: {
							required: true,
							minlength: 5,
							equalTo: "#password"
						},
						name: {
							required: true
						},
						phone: {
							required: true,
							phone: 'required'
						},
						url: {
							required: true,
							url: true
						},
						comment: {
							required: true
						},
						state: {
							required: true
						},
						platform: {
							required: true
						},
						subscription: {
							required: true
						},
						gender: 'required',
						agree: 'required'
					},
			
					messages: {
						email: {
							required: "Please provide a valid email.",
							email: "Please provide a valid email."
						},
						password: {
							required: "Please specify a password.",
							minlength: "Please specify a secure password."
						},
						subscription: "Please choose at least one option",
						gender: "Please choose gender",
						agree: "Please accept our policy"
					},
			
					invalidHandler: function (event, validator) { //display error alert on form submit   
						$('.alert-error', $('.login-form')).show();
					},
			
					highlight: function (e) {
						$(e).closest('.control-group').removeClass('info').addClass('error');
					},
			
					success: function (e) {
						$(e).closest('.control-group').removeClass('error').addClass('info');
						$(e).remove();
					},
			
					errorPlacement: function (error, element) {
						if(element.is(':checkbox') || element.is(':radio')) {
							var controls = element.closest('.controls');
							if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
							else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
						}
						else if(element.is('.select2')) {
							error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
						}
						else if(element.is('.chzn-select')) {
							error.insertAfter(element.siblings('[class*="chzn-container"]:eq(0)'));
						}
						else error.insertAfter(element);
					},
			
					submitHandler: function (form) {
					},
					invalidHandler: function (form) {
					}
				});
			
				
				$('#modal-wizard .modal-header').ace_wizard();
				$('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
			})
		</script>


	</body>
</html>				
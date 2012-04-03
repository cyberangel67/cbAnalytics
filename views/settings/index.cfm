<!---
********************************************************************************
GoogleAnalytics - A module to provide Google Anayltics to your pages
Copyright 2012 by Andrew Scott
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Andrew Scott]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************
--->

<cfoutput>
#html.startForm(name="GoogleAnalyticsSettingsForm", action=prc.CBHelper.buildModuleLink('GoogleAnalytics', 'settings.savesettings'))#
#html.anchor(name="top")#
<!--============================Sidebar============================-->
<div class="sidebar">
	<!--- Saerch Box --->
	<div class="small_box">
		<div class="header">
			<img src="<!---#prc.cbroot#--->/includes/images/settings.png" alt="info" width="24" height="24" />Actions
		</div>
		<div class="body">
			<div class="actionBar">
				#html.submitButton(value="Save Settings",class="buttonred",title="Save the comment settings")#
			</div>
		</div>
	</div>

	<!--- Info Box --->
	<div class="small_box expose">
		<div class="header">
			<img src="#prc.cbroot#/includes/images/info.png" alt="info" width="24" height="24" />Need Help?
		</div>
		<div class="body">
			<p>
				<strong>Web Destiny Development</strong> Developing in ColdBox for over 5 years, are your specialists when it
				comes to anything ColdBox and ContentBox.
			</p>
				<a href="mailto:support@webdestiny.org">Contact us</a>, we are here
				to help!

		</div>
	</div>

</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column" id="main_column">
	<div class="box">
		<div class="header">
			<img src="<!---#prc.cbroot#/includes/images/comments_32.png--->" alt="sofa" width="30" height="30" />
			Google Analytics Settings
		</div>
		<div class="body">
			#getPlugin("MessageBox").renderit()#

			<p>From here you can control how the Google Analytics operates.</p>

			<div class="body_vertical_nav clearfix">
				<ul class="vertical_nav">
					<li class="active"><a href="##global_settings"><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> Global Settings</a></li>
				</ul>
				<div class="main_column">
					<!-- Content area that wil show the form and stuff -->
					<div class="panes_vertical">
						<div>
							<fieldset>
								<legend><img src="#prc.cbRoot#/includes/images/settings_black.png" alt="modifiers"/> <strong>Global Settings</strong></legend>
								#html.textField(name = "trackingId", label = "Tracking Id", value = prc.gaSettings.trackingId, class = "textfield", size = "30")#<br/>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
#html.endForm()#
</cfoutput>
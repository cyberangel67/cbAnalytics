/********************************************************************************
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
********************************************************************************/


component hint="Google Analytics Module"{

	// Module Properties
	this.title 				= "Google Analytics";
	this.author 			= "Andrew Scott";
	this.webURL 			= "http://www.andyscott.id.au";
	this.description 		= "";
	this.version			= "0.1";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "GoogleAnalytics";


	//------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------
	function configure() {

		// parent settings
		parentSettings = {};

		// module settings - stored in modules.name.settings
		settings = {};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// datasources
		datasources = {};

		// web services
		webservices = {};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Custom Declared Points
		interceptorSettings = {
		};

		// Custom Declared Interceptors
		interceptors = [
			{class="#moduleMapping#.interceptors.gaInterceptor", name="gaInterceptor@ga"}
		];
		binder.map("settingService@ga").to("contentbox.modules.GoogleAnalytics.model.settingService");
		binder.map("installerService@ga").to("contentbox.modules.GoogleAnalytics.model.installerService");
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is registered and activated.
	//------------------------------------------------------------------------------------------------
	function onLoad() {
		// Let's add ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		// Add Menu Contribution
		menuService.addSubMenu(topMenu = menuService.MODULES, name = "GoogleAnalytics", label = "Google Analytics", href = "#menuService.buildModuleLink('GoogleAnalytics','settings')#");
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is activated by ContentBox
	//------------------------------------------------------------------------------------------------
	function onActivate() {
		var installerService = controller.getWireBox().getInstance("installerService@ga");
		installerService.execute();
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is unregistered and unloaded
	//------------------------------------------------------------------------------------------------
	function onUnload() {
		// Let's remove ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		// Remove Menu Contribution
		menuService.removeSubMenu(topMenu = menuService.MODULES, name = "GoogleAnalytics");
	}

	//------------------------------------------------------------------------------------------------
	// Fired when the module is deactivated by ContentBox
	//------------------------------------------------------------------------------------------------
	function onDeactivate() {
	}

}
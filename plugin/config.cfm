<cfsilent>
<cfif not structKeyExists(request, "pluginConfig")>
	<cfset pluginID=listGetat(getDirectoryFromPath(getCurrentTemplatePath()), listLen(getDirectoryFromPath(getCurrentTemplatePath()), application.configBean.getFileDelim())-1, application.configBean.getFileDelim())>
	<cfset request.pluginConfig = application.pluginManager.getConfig(pluginID)>
	<cfset request.pluginConfig.setSetting("pluginMode", "Admin")/>
</cfif>

<cfif request.pluginConfig.getSetting("pluginMode") eq "Admin" and not isUserInRole('S2')>
	<cfif not structKeyExists(session, "siteID") or not application.permUtility.getModulePerm(request.pluginConfig.getModuleID(), request.pSession.siteid)>
		<cflocation url="#application.configBean.getContext()#/admin/" addtoken="false">
	</cfif>
</cfif>
</cfsilent>
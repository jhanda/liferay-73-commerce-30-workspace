<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="../init.jsp" %>

<%
CPContentHelper cpContentHelper = (CPContentHelper)request.getAttribute(CPContentWebKeys.CP_CONTENT_HELPER);
CPCatalogEntry cpCatalogEntry = cpContentHelper.getCPCatalogEntry(request);
CPSku cpSku = cpContentHelper.getDefaultCPSku(cpCatalogEntry);
long cpDefinitionId = cpCatalogEntry.getCPDefinitionId();
List<CPSku> cpSkus = cpCatalogEntry.getCPSkus();
%>

<div class="catalog-card-page col-lg-6 col-md-6 col-sm-6 col-xl-4 col-xs-12">
	<div class="card">
		<div class="product-image-container">
			<a href="<%= cpContentHelper.getFriendlyURL(cpCatalogEntry, themeDisplay) %>">
				<img class="product-image" src="<%= cpCatalogEntry.getDefaultImageFileUrl() %>">
			</a>
		</div>
		<div class="card-title">
		<a href="<%= cpContentHelper.getFriendlyURL(cpCatalogEntry, themeDisplay) %>">
				<%= cpCatalogEntry.getName() %>
		</a>
		</div>

		<div class="product-footer">
			<div class="product-actions">
				<div class="product-price">
					<span class="commerce-price">
						<liferay-commerce:price CPDefinitionId="<%= cpDefinitionId %>" discountLabel="<%= LanguageUtil.get(request, "you-save") %>" />
					</span>

					<c:if test="<%= cpSku != null %>">
						<span class="commerce-subscription-info">
							<liferay-commerce:subscription-info
								CPInstanceId="<%= cpSku.getCPInstanceId() %>"
								showDuration="<%= false %>"
							/>
						</span>
					</c:if>
				</div>

<!--  
				<c:if test="<%= cpCatalogEntry.isIgnoreSKUCombinations() %>">
					<div class="autofit-row">
						<div class="autofit-col">
							<liferay-commerce:quantity-input
								CPDefinitionId="<%= cpDefinitionId %>"
								useSelect="<%= false %>"
							/>
						</div>
					</div>
				</c:if>
-->
				<c:if test="<%= !cpCatalogEntry.isIgnoreSKUCombinations() %>">
					<a class="btn btn-block btn-outline-primary text-truncate" href="<%= cpContentHelper.getFriendlyURL(cpCatalogEntry, themeDisplay) %>"><liferay-ui:message key="view-all-variants" /></a>
				</c:if>
			</div>

			<div class="product-subactions">
				<c:choose>
					<c:when test="<%= cpCatalogEntry.isIgnoreSKUCombinations() %>">
						<div class="autofit-row">
							<div class="autofit-col autofit-col-expand">
								<div class="product-list-info-compare">
									<liferay-commerce:compare-product CPDefinitionId="<%= cpDefinitionId %>" />
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="autofit-row">
							<div class="autofit-col autofit-col-expand">
								<div class="autofit-section">
									<span class="available-variants"><%= cpSkus.size() %> <liferay-ui:message key="variants-available" /></span>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
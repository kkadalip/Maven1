<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- page import="java.util.LinkedHashMap" -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="text" /> <!-- wrong: src/main/resources com.example.i18n -->


<!-- 
<c:url value="/" var="base" />
<c:url value="Osa3" var="homeLink" />
<c:url value="Search" var="searchLink" />
<c:url value="Add" var="addLink" />
<c:url value="Admin" var="adminLink" />
 -->
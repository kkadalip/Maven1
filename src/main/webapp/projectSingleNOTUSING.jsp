<!-- 
<div class="frame" id="oneperframe">

	<div class="slidee">
		<h2>This is a heading</h2>
		<p>This is a paragraph</p>
	</div>

	<div class="slidee">
		<h2>This is a heading</h2>
		<p>This is a paragraph</p>
	</div>

	<div class="slidee">
		<h2>This is a heading</h2>
		<p>This is a paragraph</p>
	</div>

</div>

<div class="frame">
	<div class="slidee">
		<h2>This in here...</h2>
		<p>
			...can be anything. <strong>Anything!</strong>
		</p>
	</div>
</div>
<div class="frame">
	<ul class="slidee">
		<li>asd1</li>
		<li>asd2</li>
		<li>asd3</li>
		<li>asd4</li>
		<li>asd5</li>
		<li>asd6</li>
		<li>asd7</li>
		<li>asd8</li>
		<li>asd9</li>
		<li>asd10</li>
	</ul>
</div>
	-->
	
<!-- 
Ei kasuta või üleliigne hetkel:

<c:forEach items="${project.imagesPromo}" var="imagePromo">
	  <div class="col-md-4">
	    <a href="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="thumbnail">
	      <p>Bla bla text and removed style="width:150px;height:150px"</p>
	      <img src="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="img-responsive" alt="Promo picture" />
	    </a>
	  </div>
	<br>
</c:forEach>
 -->


<!-- image thumbnail had eg data-size="370x500" -->
<!--  
<h2>JVR gallery:</h2>
<div class="photoswipe-gallery" itemscope itemtype="http://schema.org/ImageGallery">
	<c:forEach items="${project.imagesPromo}" var="imagePromo">
		<div class="col-md-2">
			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="thumbnail" itemprop="contentUrl" >
				<img src="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="img-responsive" itemprop="thumbnail" alt="Promo picture X" />
				</a>
				<figcaption itemprop="caption description">Whatever caption</figcaption>
			</figure>
		</div>
	</c:forEach>
</div>
-->

<!-- http://photoswipe.com/documentation/getting-started.html -->
<!-- 
<h2>First gallery:</h2>

<div class="my-gallery" itemscope itemtype="http://schema.org/ImageGallery">
	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		<a href="https://farm3.staticflickr.com/2567/5697107145_a4c2eaa0cd_o.jpg" itemprop="contentUrl" data-size="1024x1024"> 
		<img src="https://farm3.staticflickr.com/2567/5697107145_3c27ff3cd1_m.jpg" itemprop="thumbnail" alt="Image description" />
		</a>
		<figcaption itemprop="caption description">Image caption 1</figcaption>
	</figure>

	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		<a href="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg" itemprop="contentUrl" data-size="964x1024"> 
		<img src="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_m.jpg" itemprop="thumbnail" alt="Image description" />
		</a>
		<figcaption itemprop="caption description">Image caption 2</figcaption>
	</figure>

	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		<a href="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg" itemprop="contentUrl" data-size="1024x683"> 
		<img src="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_m.jpg" itemprop="thumbnail" alt="Image description" />
		</a>
		<figcaption itemprop="caption description">Image caption 3</figcaption>
	</figure>

	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		<a href="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_b.jpg" itemprop="contentUrl" data-size="1024x768"> 
		<img src="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_m.jpg" itemprop="thumbnail" alt="Image description" />
		</a>
		<figcaption itemprop="caption description">Image caption 4</figcaption>
	</figure>
</div>

<h2>Second gallery:</h2>

<div class="my-gallery" itemscope itemtype="http://schema.org/ImageGallery">
	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		<a href="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg" itemprop="contentUrl" data-size="964x1024"> 
		<img src="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_m.jpg" itemprop="thumbnail" alt="Image description" />
		</a>
		<figcaption itemprop="caption description">Image caption 2.1</figcaption>
	</figure>

	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		<a href="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg" itemprop="contentUrl" data-size="1024x683"> 
		<img src="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_m.jpg" itemprop="thumbnail" alt="Image description" />
		</a>
		<figcaption itemprop="caption description">Image caption 2.2</figcaption>
	</figure>

	<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
		<a href="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_b.jpg" itemprop="contentUrl" data-size="1024x768"> 
		<img src="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_m.jpg" itemprop="thumbnail" alt="Image description" />
		</a>
		<figcaption itemprop="caption description">Image caption 2.3</figcaption>
	</figure>
</div>
-->
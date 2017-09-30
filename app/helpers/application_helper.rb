module ApplicationHelper
	def resource
		@resource ||= User.new
		
	end

	def resource_name
		:user

		
	end

	def resource_class
		User

		
	end


	def circle_img url,size=50
		div = content_tag(:div,"",class:"circle cover",
			style:"height:#{size}px; width:#{size}px; background-image:url(#{url})")
		div.html_safe
		
	end

	def post_img url,size=100
		div = content_tag(:div,"",class:"circle cover",
			style:"height:#{size}px; width:#{size}px; background-image:url(#{url})")
		div.html_safe
		
	end

	
	def cuantosNOMegusta id, cuantos
		div2 = content_tag(:p,cuantos,class:"line left-space indianRed-text lighter",id:"#{id}")
		div2.html_safe

	end

	def cuantosShare id, cuantos
		div2 = content_tag(:p,cuantos,class:"line left-space indianRed-text lighter",id:"#{id}")
		div2.html_safe

	end

	def botonesPostMegusta postid
		div2 = content_tag(:i,"favorite_border",class:"material-icons md-29n", id:"botonLike_#{postid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon like",id:"#{postid}", for:"#onclick-megusta_")
		div2.html_safe
		div.html_safe
		
	end

	def botonesPostYaMegusta postid
		div2 = content_tag(:div,"favorite",class:"material-icons md-29", id:"botonLike_#{postid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon like",id:"#{postid}", for:"#onclick-megusta_")
		div2.html_safe
		div.html_safe
		
	end


	def botonesPostNoMegusta postid
		div2 = content_tag(:div,"",class:"md-29n iconNomegusta", id:"botonDisLike_#{postid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon dislike",id:"#{postid}", for:"#onclick-NOmegusta_")
		div2.html_safe
		div.html_safe
		
	end

	def botonesPostYaNoMegusta postid
		div2 = content_tag(:div,"",class:" md-29n iconYANomegusta", id:"botonDisLike_#{postid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon dislike",id:"#{postid}", for:"#onclick-NOmegusta_")
		div2.html_safe
		div.html_safe
		
	end

	def botonesPostShare postid
		div2 = content_tag(:i,"reply",class:"material-icons md-29n", id:"botonShare_#{postid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon sharePost",id:"#{postid}", for:"#onclick-share_")
		div2.html_safe
		div.html_safe
		
	end

	def botonesPostYAShare postid
		div2 = content_tag(:i,"reply",class:"material-icons md-29", id:"botonShare_#{postid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon sharePost",id:"#{postid}", for:"#onclick-share_")
		div2.html_safe
		div.html_safe
		
	end



	def botonesAreaMegusta areaid
		div2 = content_tag(:i,"favorite_border",class:"material-icons md-30AreaN", id:"botonVote_#{areaid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon area",id:"#{areaid}", for:"#onclick-vote_")
		div2.html_safe
		div.html_safe
		
	end

	def botonesAreaYaMegusta areaid
		div2 = content_tag(:div,"favorite",class:"material-icons md-30Area", id:"botonVote_#{areaid}")
		div = content_tag(:button,div2,class:"mdl-button mdl-js-button mdl-button--icon",id:"#{areaid}", for:"#onclick-vote_")
		div2.html_safe
		div.html_safe
		
	end

	


end

class PostDecorator < ApplicationDecorator
  delegate_all

  def CuantosShare

    if object.repost_id != nil #si el post es compartido 
      h.link_to "#{Post.find(object.repost_id).shares.count}",h.modalShare_path(idpost_param: Post.find(object.repost_id).id),:remote => true,id:"shares_#{Post.find(object.repost_id).id}",class:"NoUnderline indianRed-text lighter"
    else
      h.link_to "#{post.shares.count}",h.modalShare_path(idpost_param: object.id), :remote => true ,id:"shares_#{object.id}",class:"NoUnderline indianRed-text lighter"
    end
    
  end

  def ButtonShare
    if object.repost_id != nil
      if (Post.find(object.repost_id)).already_shares?(h.current_user) == false
        return h.botonesPostShare object.repost_id
      else
        return h.botonesPostYAShare object.repost_id

      end
    end

    if object.already_shares?(h.current_user) == false
      return h.botonesPostShare object.id

    else
      return h.botonesPostYAShare object.id
    end
    
  end

  #Boton NO me gusta y cuantos
  def buttonNOOMeGusta
    if object.repost_id != nil #post compartido
      if (Post.find(object.repost_id)).already_dislikes?(h.current_user) == false
      return (dislikesDecorator + (h.botonesPostNoMegusta post.repost_id)).html_safe #no click
      else
      return (dislikesDecorator + (h.botonesPostYaNoMegusta post.repost_id)).html_safe #YA click

      end
    end


    if object.already_dislikes?(h.current_user) == false #post original
      return (dislikesDecorator + (h.botonesPostNoMegusta post.id)).html_safe #no click
    else
      return (dislikesDecorator + (h.botonesPostYaNoMegusta post.id)).html_safe #YA click

    end
    
  end


  def dislikesDecorator #helper, cuantos dislikes
    if object.repost_id != nil
      return h.cuantosNOMegusta "dislikes_#{(Post.find(object.repost_id)).id}", Post.find(object.repost_id).dislikes.count
    else
      return h.cuantosNOMegusta "dislikes_#{post.id}", post.dislikes.count #cuantos post original
    end
    
    
  end

  #Boton me gusta y cuantos
  def buttonMeGusta

    if object.repost_id != nil #post compartido
      if (Post.find(object.repost_id)).already_likes?(h.current_user) == false 
      return (likesDecorator + (h.botonesPostMegusta post.repost_id)).html_safe #no click
      else
      return (likesDecorator + (h.botonesPostYaMegusta post.repost_id)).html_safe #ya click

      end
    end


    if object.already_likes?(h.current_user) == false #post original
      return (likesDecorator + (h.botonesPostMegusta post.id)).html_safe #no click
    else
      return (likesDecorator + (h.botonesPostYaMegusta post.id)).html_safe #ya click

    end
    
  end


  def likesDecorator
    if object.repost_id != nil #si el post es compartido 
      h.link_to "#{(Post.find(object.repost_id)).likes.count}",h.modal_path(idpost_param: Post.find(object.repost_id).id),:remote => true,id:"likes_#{(Post.find(object.repost_id)).id}",class:"NoUnderline indianRed-text lighter"
    else
      h.link_to "#{post.likes.count}",h.modal_path(idpost_param: object.id), :remote => true ,id:"likes_#{post.id}",class:"NoUnderline indianRed-text lighter"
    end  
    
    
  end

  

  #Nombre de usuarios POST!
  def NombreUsarioPost
    if object.repost_id != nil
      return usuarioCompartirPost.html_safe
    else
      return usuarioPost.html_safe

    end

  end

  def usuarioPost
    h.link_to object.user.username , object.user, class:"indianRed-text NoUnderline lighter"
  end

  def usuarioCompartirPost
    h.link_to object.usershare(object.repost_id).username, object.usershare(object.repost_id),class:"indianRed-text NoUnderline lighter"
    
  end

  #Fecha Post
  def fechaPost
    return fecha.html_safe
    
  end
  
  def fecha
    object.created_at.strftime("%b. %e, %Y at %I:%M %p")
    
  end
  

  #Icono
  def iconoPost
    if object.repost_id != nil
      return iconoCompartido.html_safe
    else
      return iconoNormal.html_safe
    end
    
  end

  def iconoNormal
    h.circle_img object.user.avatar.url(:medium),50
  end

  def iconoCompartido
    h.circle_img object.usershare(object.repost_id).avatar.url(:medium),50
  end

  #Link usuario
  def linkPostUsuario
    return (usuarioPost).html_safe
    
  end

  def linkPostUsuarioCompartir
    return usuarioCompartirPost.html_safe
    
  end


  
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end

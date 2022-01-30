module ApplicationHelper
  def default_meta_tags
    def default_meta_tags
    {
      site: 'Small-diary',
      title: 'Small-diary',
      reverse: true,
      separator: '|',  
      description: '毎日ある小さな思い出を日記にしましょう！',
      keywords: 'small-diary',   
      canonical: request.original_url,  
      noindex: ! Rails.env.production?,
      
      og: {
        site_name: 'Small-diary',
        title: 'Small-diary',
        description: '毎日ある小さな思い出を日記にしましょう！', 
        type: 'website',
        url: request.original_url,
        
        locale: 'ja_JP',
      },
    }
  end
  end
end

module ApplicationHelper
    def default_meta_tags
    {
      site: '毎日ある小さな思い出を日記にしましょう！',
      title: 'Small-diary',
      reverse: true,
      separator: '|',  
      description: '日記が苦手な人でも大丈夫。あなたが書くのは一言だけ、今日の小さな思い出を一言にするだけ。',
      keywords: 'small-diary',   
      canonical: request.original_url,  
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('logo.png') },
        { fref: image_url('logo.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'Small-diary',
        title: 'Small-diary',
        description: '日記が苦手な人でも大丈夫。あなたが書くのは一言だけ、今日の小さな思い出を一言にするだけ。', 
        type: 'website',
        url: request.original_url,
        image: image_url('logo.png'),
        locale: 'ja_JP',
      },
    }
  end
end


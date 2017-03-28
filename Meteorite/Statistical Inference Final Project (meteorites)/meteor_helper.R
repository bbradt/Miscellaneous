# My helper functions
# I had to write this function to strip HTML
html_strip <- function(html_text){
  final_text <- ""
  
  beg <- gregexpr(pattern = '<',html_text)[[1]]
  end <- gregexpr(pattern = '>', html_text)[[1]]
  
  for (i in 1:nchar(html_text)){
    flag <- TRUE
    for (j in 1:length(beg)){
      if (is.na((i >= beg[j] && i <= end[j]))){break}
      if ((i >= beg[j] && i <= end[j])){
        flag <- FALSE
      }
    }
    if (flag){
      final_text <- paste(final_text,substr(html_text,i,i),sep="")
    }
  }
  return(final_text)
}

extract_between <- function(str,start,end,remove_spaces=FALSE){
  return_string <- ""
  if (is.integer(start) && is.integer(end)){
    return_string <- substr(str,start,end)   
  }else if(is.integer(start) && is.character(end)){
    return_string <- substr(str,start,gregexpr(pattern=end,str)[1]-nchar(end))
  }else if(is.character(start) && is.integer(end)){
    return_string <- substr(str,regexpr(pattern=start,str)[1]+nchar(start),end)
  }else if(is.character(start) && is.character(end)){
    return_string <- substr(str,regexpr(pattern=start,str)[1]+nchar(start),regexpr(pattern=end,str)[1]-nchar(end)+1)
  }else{
    #print('uh oh')
  }
  if (remove_spaces){
    return_string <- gsub(" ","",return_string)
  }
  return(return_string)
}

firefox_n_html <- function(url_vector,n,output="C:/Users/Brad/Desktop/INFER/htmls/"){
  if (n >length(url_vector)){n<-length(url_vector);}
  if (1+n-1 > length(url_vector)){stop("Not enough URLS in input vector")}
  else{
      for (url_index in 1:n){
      download.file(url_vector[url_index],destfile=paste(output,url_index,".html",sep=""),method="auto")
    }
  }
}

poissonness_plot <- function(y,inds){
  n=length(y[inds])
  print(inds)
  print((x=table(y[inds])))
  x=as.vector(x)
  x1 = ifelse(x==0,NA,ifelse(x>1,x-.8*x/n-.67,exp(-1)))
  k=0:(length(x1)-1)
  plot(k,log(x1)+lfactorial(k))
  print(n*(1-cor(k,log(x)+lfactorial(k))^2))
}
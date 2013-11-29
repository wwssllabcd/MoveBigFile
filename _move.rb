
curPath = Dir.pwd
totalFullFilePath =""
Dir.glob("**/*") {|f|

	a =  File.stat(f)
	
	fileSize = a.size/1024/1024;
	#puts fileSize
	
	
	if fileSize>100
		fullPath = curPath + "/" + f 
		fullPath = "move \"" + fullPath + "\" " + curPath + "\n"
		
		totalFullFilePath += fullPath 
	end
	

	
}  

	totalFullFilePath = totalFullFilePath.gsub("/", "\\")

	out =  File.open("_move.txt","w")
	out.write(totalFullFilePath)
	out.close
	
	out =  File.open("_batch_move.bat","w")
	out.write(totalFullFilePath)
	out.close
	
	
	

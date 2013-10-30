<?php
	//This is the database file module for uploading and downloading user files
	
	class FileModule
	{
		private $dbConnection;
		

		
		function FileModule($connection)
		{
			$this->dbConnection = $connection; //use the connection that was given to me
		}
		
		//upload a file based on username
		function upload($userName, $fileName, $file, $public) {
			if(!$this->fileExists($userName, $fileName)) {
				$datetime = date("Y-m-d H:i:s");
				$stmt = $this->dbConnection->prepare("INSERT INTO files VALUES(?, ?, ?, ?, ?)");
				$stmt->bind_param("sssss", $userName, $fileName, $file, $public, $datetime);
				if(!$stmt->execute()) {
					$stmt->close();
					return false;
				}
				else {
					$stmt->close();
				}
				return true;
			}
			return false;
		}
		
		/*
			This function gets files' information based on username and stores it in a
			2d array, which it then returns.  To access the data in this array, you have
			to specify the row number first, followed by the associated name of the
			variable that you wish to access.
			
			Ex: $filesArray[0]["fileName"] returns the first row's fileName field,
				  whereas $filesArray[0]["lastUpdate"] returns the first row's lastUpdate
				  field
		*/
		function getFilesInfo($userName) {
			//file name, public, last updated
			$stmt = $this->dbConnection->prepare("SELECT fileName, public, lastUpdate
			                                      FROM files
			                                      WHERE owner = ?");
			$stmt->bind_param("s", $userName);
			$stmt->execute();
			$stmt->bind_result($fileName, $public, $lastUpdate);
			$filesArray = array();
			for($i = 0; $stmt->fetch(); $i++) {
				$filesArray[$i] = array( "fileName" => $fileName,
				                        "public" => $public,
				                        "lastUpdate" => $lastUpdate );
			}
			$stmt->close();
			return $filesArray;
		}
		
		/*
			This function gets the public files' information and stores it in a
			2d array, which it then returns.  To access the data in this array, you have
			to specify the row number first, followed by the associated name of the
			variable that you wish to access.
			
			Ex: $filesArray[0]["Owner"] returns the first row's Owner field,
				  whereas $filesArray[0]["fileName"] returns the first row's fileName
				  field
		*/
		function getPublicFilesInfo() {
			$stmt = $this->dbConnection->prepare("SELECT owner, fileName, lastUpdate
			                                      FROM files
			                                      WHERE public = 1");
		    $stmt->execute();
		    $stmt->bind_result($owner, $fileName, $lastUpdate);
		    $filesArray = array();
		    for($i = 0; $stmt->fetch(); $i++) {
		    	$filesArray[i] = array( "owner" => $owner,
		    	                        "fileName" => $fileName,
		    	                        "lastUpdate" => $lastUpdate);
		    }
		    $stmt->close();
		    return $filesArray;
		}
		
		//get file contents based on the file's owner and filename
		function getFileContents($owner, $fileName) {
			$stmt = $this->dbConnection->prepare("SELECT fileContents
			                                      FROM files
			                                      WHERE owner = ? AND fileName = ?");
			$stmt->bind_param("ss", $owner, $fileName);
			$stmt->execute();
			$stmt->bind_result($file);
			$stmt->fetch();
			$stmt->close();
			return $file;
		}
		
		//internal function, check if username is valid; not yet used
		function validUserName($userName) {
			if($stmt = $this->dbConnection->prepare("SELECT COUNT(username)
													FROM usersinfo
													WHERE username = ?"));
			$stmt->bind_param("s", $userName);
			$stmt->execute();
			$stmt->bind_result($userNameCount);
			$stmt->fetch();
			$stmt->close();
			if ($userNameCount != 0) { //the username must exist
				return true;
			}
			else return false;
		}
		
		//internal function, check if filename exists under the username
		function fileExists($userName, $fileName) {
			if($stmt = $this->dbConnection->prepare("SELECT COUNT(fileName)
													FROM files
													WHERE owner = ? AND fileName = ?"));
			$stmt->bind_param("ss", $userName, $fileName);
			$stmt->execute();
			$stmt->bind_result($fileCount);
			$stmt->fetch();
			$stmt->close();
			if ($fileCount != 0) { //the file must exist
				return true;
			}
			else return false;	
		}
	}

?>
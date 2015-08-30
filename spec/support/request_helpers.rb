module Request
	module JsonHelpers
		#JSON response 
		def json_response
			@json_response ||= JSON.parse(response.body, symbolize_names: true )
		end 
	end

	#Headers helpers module
	module HeadersHelpers 
		#API version number header, v1 as default
		def api_header(version = 1)
			request.headers['Accept'] = "application/vnd.onlinestore.v#{version}"
		end 

		#Response format, JSON as default
		def api_response_format(format = Mime::JSON)
			request.headers['Accept'] = "#{request.headers['Accept']}, #{format}"
			request.headers['Content-Type'] = format.to_s
		end 

		def include_default_accept_headers
			api_header
			api_response_format
		end 

		def api_authorization_header(token)
			request.headers['Authorization'] = token
		end 
	end  
end 
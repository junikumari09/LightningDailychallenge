public with sharing class DailyChallenge1 {
    public DailyChallenge1() {

    }

  public static Integer getRecipeDetails() {
	HTTP http = new HTTP();
	HttpRequest request= new HttpRequest();
	request.setMethod('GET');
	request.setEndPoint('https://dummyjson.com/recipes/1');
	try{
		HttpResponse response = http.send(request);
		if(response.getStatusCode()==200){
			String responseBody= response.getBody();
			Map<String, Object> jsonResponse= (Map<String, Object>)JSON.deserializeUntyped(responseBody);
			 Integer cookTimeMinutes =(Integer) jsonResponse.get('cookTimeMinutes');
			return cookTimeMinutes;
		}
		else {
			System.debug('Error Code'+response.getStatusCode());
		}
	}	catch(Exception e){
			System.debug('Exception Occured'+ e.getMessage());
		}
	//Write your code here to fetch recipe from https://dummyjson.com/recipes/1
	// Parse the JSON response and return the cookTimeMinutes field
	System.debug('Debug: Making HTTP request to DummyJSON recipes endpoint');
	return null;
}
    
    
    public static void testGetRecipeDetails() {
        Integer cookTime = getRecipeDetails();
        System.debug('Cook Time: ' + cookTime);
    }
}
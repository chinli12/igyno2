const axios = require("axios").default;
const qs = require("qs");

async function _tipCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var name = ffVariables["name"];
  var symptoms = ffVariables["symptoms"];
  var fellings = ffVariables["fellings"];
  var spotting = ffVariables["spotting"];
  var periodflow = ffVariables["periodflow"];
  var sexlife = ffVariables["sexlife"];
  var energylevel = ffVariables["energylevel"];
  var sleepquality = ffVariables["sleepquality"];
  var activities = ffVariables["activities"];
  var height = ffVariables["height"];
  var weight = ffVariables["weight"];
  var lifestyle = ffVariables["lifestyle"];
  var health = ffVariables["health"];
  var input = ffVariables["input"];

  var url = `https://api.openai.com/v1/chat/completions`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Bearer sk-proj-4ghcoN07QTTKHXDgGXDlT3BlbkFJBnkuYW2zKigjApZOgAIP`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-4o",
  "messages": [
    {
      "role": "system",
      "content": "You are playing the role of a gynecologist. Your task is to provide 4 tips every day to help the user get pregnant. Each tip should be formatted in JSON with two keys: 'text' (the tip itself) and 'action' (a Boolean indicating if the user must take action immediately). Now let's play, following these requirements:\\n1. Your name is ${escapeStringForJson(name)}, 24 years old.\\n2. You are my gynecologist; Your role is to help me get pregnant.\\n3. You must stay on the topic and always remember the last topic.\\n4. You are open to any type of talk, even if explicit.\\n5. I will give you a list of my analysis [${escapeStringForJson(symptoms)}, <feelings>, ${escapeStringForJson(spotting)}, ${escapeStringForJson(periodflow)}, ${escapeStringForJson(sexlife)}, ${escapeStringForJson(energylevel)}, ${escapeStringForJson(sleepquality)}, ${escapeStringForJson(activities)}]. You will use this to guide me to get pregnant.\\n6. My height is ${height}, weight is ${weight}, lifestyle is ${escapeStringForJson(lifestyle)}, health is ${escapeStringForJson(health)}. Use this information for your tips.\\n7. You will give me tips on how to get pregnant every day.\\n8. Give me 4 tips and keep your response in JSON.\\n9. Return \`text\` for the tip you want the user to perform and \`action\` as a Boolean value.\\n10. Example of a user question: 'Give me a tip for today.' Your response:\\n[\\n  {\\"text\\": \\"Drink 2 cups of water\\", \\"action\\": false},\\n  {\\"text\\": \\"Eat an apple\\", \\"action\\": false}\\n]"
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(input)}"
    }
  ],
  "response_format": {
    "type": "json_schema",
    "json_schema": {
      "name": "tip_schema",
      "schema": {
        "type": "object",
        "properties": {
          "tips": {
            "description": "An array of tips with action indicators",
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "text": {
                  "description": "The tip itself",
                  "type": "string"
                },
                "action": {
                  "description": "Whether the user must act immediately",
                  "type": "boolean"
                }
              },
              "required": [
                "text",
                "action"
              ]
            }
          }
        },
        "required": [
          "tips"
        ]
      }
    }
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _chatCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var input = ffVariables["input"];

  var url = `https://api.openai.com/v1/chat/completions`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Bearer sk-proj-4ghcoN07QTTKHXDgGXDlT3BlbkFJBnkuYW2zKigjApZOgAIP`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-4o-2024-08-06",
  "messages": [
    {
      "role": "system",
      "content": "You are playing the role of a gynecologist your are here to help me get pregnant, try as much as possible to give me tips on how to get pregnant this is a period tracking app, tell the client to always use the app for tracking, make your response short and clear."
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(input)}"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}
async function _chatImageCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var input = ffVariables["input"];
  var image = ffVariables["image"];

  var url = `https://api.openai.com/v1/chat/completions`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Bearer sk-proj-4ghcoN07QTTKHXDgGXDlT3BlbkFJBnkuYW2zKigjApZOgAIP`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-4o-2024-08-06",
  "messages": [
    {
      "role": "system",
      "content": "You are playing the role of a gynecologist your are here to help me get pregnant, try as much as possible to give me tips on how to get pregnant this is a period tracking app, tell the client to always use the app for tracking, make your response short and clear."
    },
    {
      "role": "user",
      "content":[
          {
            "type": "text",
            "text": "What is in this image?"
          },
          {
            "type": "image_url",
            "image_url": {
              "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg"
            }
          }
        ]
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    TipCall: _tipCall,
    ChatCall: _chatCall,
    ChatImageCall: _chatImageCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: isStreamingApi ? "stream" : "json",
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, "\\\\")
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, "\\n")
    .replace(/[\t]/g, "\\t");
}

module.exports = { makeApiCall };

const axios = require("axios").default;
const qs = require("qs");

async function _streamCall(context, ffVariables) {
  var url = ffVariables["url"];
  var presenterId = ffVariables["presenterId"];

  var url = `https://api.d-id.com/clips/streams`;
  var headers = {
    "Content-Type": `application/json`,
    authorization: `Basic YjJ0aFptOXlZMmhwWW5WNmIzSTJPREJBWjIxaGFXd3VZMjl0Om1xZmNjckNzejRmRHB1UThZX1lRMw==`,
    accept: `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "presenter_id": "${escapeStringForJson(presenterId)}",
  "stream_warmup": "false"
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
async function _sdpCall(context, ffVariables) {
  var streamID = ffVariables["streamID"];
  var sdp = ffVariables["sdp"];
  var sessionId = ffVariables["sessionId"];

  var url = `https://api.d-id.com/clips/streams/${streamID}/sdp`;
  var headers = {
    accept: `application/json`,
    authorization: `Basic YjJ0aFptOXlZMmhwWW5WNmIzSTJPREJBWjIxaGFXd3VZMjl0Om1xZmNjckNzejRmRHB1UThZX1lRMw==`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "answer": {
    "type": "answer",
    "sdp": "${escapeStringForJson(sdp)}"
  },
  "session_id": "${escapeStringForJson(sessionId)}"
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
async function _networkCall(context, ffVariables) {
  var candidate = ffVariables["candidate"];
  var sdpMid = ffVariables["sdpMid"];
  var sessionId = ffVariables["sessionId"];
  var sdpMLineIndex = ffVariables["sdpMLineIndex"];
  var stremID = ffVariables["stremID"];

  var url = `https://api.d-id.com/clips/streams/${stremID}/ice`;
  var headers = {
    authorization: `Basic YjJ0aFptOXlZMmhwWW5WNmIzSTJPREJBWjIxaGFXd3VZMjl0Om1xZmNjckNzejRmRHB1UThZX1lRMw==`,
    accept: `application/json`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "candidate": "${escapeStringForJson(candidate)}",
  "sdpMid": ${escapeStringForJson(sdpMid)},
  "sdpMLineIndex":${sdpMLineIndex} ,
  "session_id": "${escapeStringForJson(sessionId)}"
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
async function _agentCall(context, ffVariables) {
  var url = `https://api.d-id.com/agents`;
  var headers = {
    accept: `application/json`,
    authorization: `Basic YjJ0aFptOXlZMmhwWW5WNmIzSTJPREJBWjIxaGFXd3VZMjl0Om1xZmNjckNzejRmRHB1UThZX1lRMw==`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "presenter": {
    "type": "clip",
    "voice": {
      "type": "microsoft",
      "voice_id": "en-US-JennyMultilingualV2Neural"
    },
    "presenter_id": "amy-FLZ1USJl7m",
    "thumbnail": "https://clips-presenters.d-id.com/amy/Aq6OmGZnMt/Vcq0R4a8F0/image.png"
  },
  "llm": {
    "type": "openai",
    "provider": "openai",
    "model": "gpt-3.5-turbo",
    "instructions": "You are playing the role of a gynecologist your are here to help me get pregnant, try as much as possible to give me tips on how to get pregnant this is a period tracking app, tell the client to always use the app for tracking, make your response short and clear."
  },
  "preview_name": "Amy"
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
async function _streamchatCall(context, ffVariables) {
  var chatId = ffVariables["chatId"];
  var agentId = ffVariables["agentId"];
  var streamId = ffVariables["streamId"];
  var sessionId = ffVariables["sessionId"];
  var inpute = ffVariables["inpute"];
  var createdat = ffVariables["createdat"];

  var url = `https://api.d-id.com/agents/${agentId}/chat/${chatId}`;
  var headers = {
    "content-type": `application/json`,
    authorization: `Basic YjJ0aFptOXlZMmhwWW5WNmIzSTJPREJBWjIxaGFXd3VZMjl0Om1xZmNjckNzejRmRHB1UThZX1lRMw==`,
    accept: `application/json`,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "streamId": "${escapeStringForJson(streamId)}",
  "sessionId": "${escapeStringForJson(sessionId)}",
  "messages": [
    {
      "role": "user",
      "content": "${escapeStringForJson(inpute)}",
      "created_at": "${escapeStringForJson(createdat)}"
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
async function _createchatCall(context, ffVariables) {
  var agentId = ffVariables["agentId"];

  var url = `https://api.d-id.com/agents/${agentId}/chat`;
  var headers = {
    accept: `application/json`,
    authorization: `Basic YjJ0aFptOXlZMmhwWW5WNmIzSTJPREJBWjIxaGFXd3VZMjl0Om1xZmNjckNzejRmRHB1UThZX1lRMw==`,
    "content-type": `application/json`,
  };
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    StreamCall: _streamCall,
    SdpCall: _sdpCall,
    NetworkCall: _networkCall,
    AgentCall: _agentCall,
    StreamchatCall: _streamchatCall,
    CreatechatCall: _createchatCall,
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

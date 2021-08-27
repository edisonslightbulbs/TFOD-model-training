# Model training using TF's object detection API

Given that this project primarily uses scripts, it's helpful to have an idea of the directory structure.

```
.
├── annotations
├── external
│   ├── labelImg
│   │   ├── build-tools
│   │   ├── data
│   │   ├── demo
│   │   ├── libs
│   │   ├── readme
│   │   ├── requirements
│   │   ├── resources
│   │   ├── tests
│   │   └── tools
│   └── models
│       ├── community
│       ├── official
│       ├── orbit
│       └── research
├── models
│   ├── export
│   └── pretrained
├── records
├── resources
│   └── images
│       ├── test
│       └── train
└── scripts
```

Now that that is out of the way - the project houses three notebooks that build on each other. The notebooks are self-documnting and should be reviewed in the order:

1.  [train.ipynb](./train.ipynb)
2.  [detect.ipynb](./detect.ipynb)
3.  [export.ipynb](./export.ipynb)e

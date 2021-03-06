"
Abstract class to provide menu facilties for Exercism that should only appear in the context of the Exercism package (and not other browser packages)
"
Class {
	#name : #ClyExercismCommand,
	#superclass : #SycPackageCommand,
	#instVars : [
		'browser',
		'selectedItem'
	],
	#category : #'ExercismTools-Menus'
}

{ #category : #activation }
ClyExercismCommand class >> canBeExecutedInContext: aToolContext [
	^ (super canBeExecutedInContext: aToolContext)
		and: [ self isExercismTagIn: aToolContext ]
]

{ #category : #testing }
ClyExercismCommand class >> isAbstract [
	
	^self == ClyExercismCommand
]

{ #category : #testing }
ClyExercismCommand class >> isExercismTagIn: aToolContext [
	
	^false
]

{ #category : #accessing }
ClyExercismCommand >> browser [
	^ browser
]

{ #category : #accessing }
ClyExercismCommand >> browser: anObject [
	browser := anObject
]

{ #category : #accessing }
ClyExercismCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	
	self selectedItem: (self selectedItemIn: aToolContext).
	self browser: aToolContext tool
]

{ #category : #accessing }
ClyExercismCommand >> selectedItem [
	^ selectedItem
]

{ #category : #accessing }
ClyExercismCommand >> selectedItem: anObject [
	selectedItem := anObject
]

{ #category : #accessing }
ClyExercismCommand >> selectedItemIn: aToolContext [
	^ aToolContext lastSelectedClassGroup
]
